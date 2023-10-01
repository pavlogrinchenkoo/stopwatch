// import 'package:claude/api/chatGpt/request.dart';
// import 'package:claude/api/stability/dto.dart';
// import 'package:claude/screens/main_screen/bloc.dart';
// import 'package:dio/dio.dart';
//
// class StabilityRequest {
//   final Dio _dio = Dio();
//   final ChatGptRequest _request = ChatGptRequest();
//
//   Future<StabilityModel> getImage(
//       bool isInterpretation,
//       String artist,
//       String style,
//       ImageSizeEnumzeEnum imageSize,
//       String message,
//       String artisticInterpretationPrompt) async {
//     String prompt = message;
//
//     if (isInterpretation) {
//       final res = await _request.getPrompt(
//           artist, style, message, artisticInterpretationPrompt);
//       prompt = res;
//     } else {
//       prompt += "$artist $style";
//     }
//
//     _dio.options.headers["Accept"] = "application/json";
//     _dio.options.headers["Content-Type"] = "application/json";
//
//     final body = {
//       "steps": 40,
//       "width": imageSize == ImageSizeEnum.twoToOne
//           ? imageSize == ImageSizeEnum.oneToOne
//               ? 1024
//               : 1536
//           : 640,
//       "height": imageSize == ImageSizeEnum.oneToTwo
//           ? imageSize == ImageSizeEnum.oneToOne
//               ? 1024
//               : 1536
//           : 640,
//       'seed': 0,
//       "cfg_scale": 5,
//       "samples": 1,
//       "text_prompts": [
//         {"text": prompt, "weight": 1}
//       ],
//     };
//
//     final res = await _dio.post(
//         "https://api.stability.ai/v1/generation/stable-diffusion-512-v2-1/text-to-image",
//         data: body);
//
//     return StabilityModel.fromJson(res.data);
//   }
// }
