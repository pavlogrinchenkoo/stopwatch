import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quad_timer/api/cashe.dart';
import 'package:quad_timer/api/time/dto.dart';
import 'package:quad_timer/utils/bloc_base.dart';
import 'package:quad_timer/widgets/custom_show_dialog.dart';
import 'package:quad_timer/widgets/snack_bar.dart';
import 'package:share_plus/share_plus.dart';

class AnalyticsBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  Cache cache = Cache();

  AnalyticsBloc() {
    setState(ScreenState());
  }

  void init() async {
    final listVaultCue = await cache.getTimeCue('vault_cue');
    final listBeamCue = await cache.getTimeCue('beam_cue');
    final listBarsCue = await cache.getTimeCue('bars_cue');
    final listFloorCue = await cache.getTimeCue('floor_cue');
    final listVaultClear = await cache.getTimeCue('vault_clear');
    final listBeamClear = await cache.getTimeCue('beam_clear');
    final listBarsClear = await cache.getTimeCue('bars_clear');
    final listFloorClear = await cache.getTimeCue('floor_clear');
    setState(currentState.copyWith(
        vaultCue: calculateAverageTime(listVaultCue ?? []),
        barsCue: calculateAverageTime(listBarsCue ?? []),
        beamCue: calculateAverageTime(listBeamCue ?? []),
        floorCue: calculateAverageTime(listFloorCue ?? []),
        vaultClear: calculateAverageTime(listVaultClear ?? []),
        barsClear: calculateAverageTime(listBarsClear ?? []),
        beamClear: calculateAverageTime(listBeamClear ?? []),
        floorClear: calculateAverageTime(listFloorClear ?? []),
        loading: false));
  }

  String calculateAverageTime(List<TimeModel> timeList) {
    if (timeList.isEmpty) {
      return '00:00:00';
    }

    int totalSeconds = 00;
    int totalMinutes = 00;
    int totalHours = 00;
    for (final time in timeList) {
      totalSeconds += time.seconds;
      totalMinutes += time.minutes;
      totalHours += time.hours;
    }

    int averageSeconds = totalSeconds ~/ timeList.length;
    int averageMinutes = totalMinutes ~/ timeList.length;
    int averageHours = totalHours ~/ timeList.length;

    averageMinutes += averageSeconds ~/ 60;
    averageSeconds %= 60;
    averageHours += averageMinutes ~/ 60;
    averageMinutes %= 60;

    return '${formatNumber(averageHours)}:${formatNumber(averageMinutes)}:${formatNumber(averageSeconds)}';
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  Excel generateExcelFile() {
    final excel = Excel.createExcel();

    final Sheet sheet = excel['Analytics'];

    sheet.cell(CellIndex.indexByString('A1')).value =
        const TextCellValue('Average Value');
    sheet.cell(CellIndex.indexByString('B1')).value =
        const TextCellValue('Vault');
    sheet.cell(CellIndex.indexByString('C1')).value =
        const TextCellValue('Beam');
    sheet.cell(CellIndex.indexByString('D1')).value =
        const TextCellValue('Bars');
    sheet.cell(CellIndex.indexByString('E1')).value =
        const TextCellValue('Floor');
    sheet.cell(CellIndex.indexByString('A2')).value =
        const TextCellValue('Start to Cued');
    sheet.cell(CellIndex.indexByString('A3')).value =
        const TextCellValue('Start to Clear');
    sheet.cell(CellIndex.indexByString('B2')).value =
        TextCellValue(currentState.vaultCue);
    sheet.cell(CellIndex.indexByString('B3')).value =
        TextCellValue(currentState.vaultClear);
    sheet.cell(CellIndex.indexByString('C2')).value =
        TextCellValue(currentState.beamCue);
    sheet.cell(CellIndex.indexByString('C3')).value =
        TextCellValue(currentState.beamClear);
    sheet.cell(CellIndex.indexByString('D2')).value =
        TextCellValue(currentState.barsCue);
    sheet.cell(CellIndex.indexByString('D3')).value =
        TextCellValue(currentState.barsClear);
    sheet.cell(CellIndex.indexByString('E2')).value =
        TextCellValue(currentState.floorCue);
    sheet.cell(CellIndex.indexByString('E3')).value =
        TextCellValue(currentState.floorClear);
    return excel;
  }

  Future<void> saveDataToFile(
      Excel excel, String fileName, BuildContext context) async {
    try {
      Directory? root = await getApplicationDocumentsDirectory();
      String directoryPath = '${root.path ?? ''}/analytics';
      final directory = Directory(directoryPath);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      final file = File('${directory.path}/$fileName.xlsx');
      await file.writeAsBytes(excel.encode()!);
      print('File saved: ${file.path}');
      if (context.mounted) {
        SnackBarService.showSnackBar(
          context,
          'File saved: $fileName.xlsx',
          false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        SnackBarService.showSnackBar(
          context,
          'Error saving file: $e',
          true,
        );
      }
    }
  }

  void downloadFile(
    BuildContext context,
  ) async {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => CustomShowDialog(
              title: 'Enter File Name',
              text: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter file name',
                ),
              ),
              buttonTwo: 'Save',
              buttonOne: 'Cancel',
              onTapTwo: () async {
                if (controller.text.isNotEmpty) {
                  final excel = generateExcelFile();
                  await saveDataToFile(excel, controller.text, context);
                  if (context.mounted) context.router.pop();
                }
              },
              onTapOne: () {
                context.router.pop();
              },
            ));
  }

  Future<void> saveFileShare(Excel excel, String directoryPath) async {
    final directory = Directory(directoryPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    final file = File('${directory.path}/analytics.xlsx');
    await file.writeAsBytes(excel.encode()!);
    print('File saved: ${file.path}');
  }

  void shareFile(BuildContext context) async {
    final excel = generateExcelFile();
    Directory? root = await getTemporaryDirectory();
    String directoryPath = '${root.path ?? ''}/analytics';
    final directory = Directory(directoryPath);
    saveFileShare(excel, directoryPath);
    final box = context.findRenderObject() as RenderBox?;
    Share.shareXFiles(
      [XFile('${directory.path}/analytics.xlsx')],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
    print('File shared');
  }

  void removeTime() {
    cache.removeTimeClear();
    cache.removeTimeCue();
    init();
  }

  void showButton() {
    setState(currentState.copyWith(isShowButton: !(currentState.isShowButton)));
  }
}

class ScreenState {
  final bool loading;
  final bool isShowButton;
  final String vaultCue;
  final String beamCue;
  final String barsCue;
  final String floorCue;
  final String vaultClear;
  final String beamClear;
  final String barsClear;
  final String floorClear;

  ScreenState({
    this.loading = true,
    this.isShowButton = false,
    this.vaultCue = '00:00:00',
    this.beamCue = '00:00:00',
    this.barsCue = '00:00:00',
    this.floorCue = '00:00:00',
    this.vaultClear = '00:00:00',
    this.beamClear = '00:00:00',
    this.barsClear = '00:00:00',
    this.floorClear = '00:00:00',
  });

  ScreenState copyWith(
      {bool? loading,
      bool? isShowButton,
      String? vaultCue,
      String? beamCue,
      String? barsCue,
      String? floorCue,
      String? vaultClear,
      String? beamClear,
      String? barsClear,
      String? floorClear}) {
    return ScreenState(
      loading: loading ?? this.loading,
      isShowButton: isShowButton ?? this.isShowButton,
      vaultCue: vaultCue ?? this.vaultCue,
      beamCue: beamCue ?? this.beamCue,
      barsCue: barsCue ?? this.barsCue,
      floorCue: floorCue ?? this.floorCue,
      vaultClear: vaultClear ?? this.vaultClear,
      beamClear: beamClear ?? this.beamClear,
      barsClear: barsClear ?? this.barsClear,
      floorClear: floorClear ?? this.floorClear,
    );
  }
}
