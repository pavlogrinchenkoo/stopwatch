import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korsun/screens/splash_page/bloc/state.dart';

class FavoritCubit extends Cubit<State> {
  FavoritCubit() : super(EmptyState());

  Future<void> getFavorites() async {
    try {
      emit(LoadingState());
      emit(LoadedState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}