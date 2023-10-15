import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/0_data/models/book.dart';
import 'package:zindl_hub/0_data/models/weather.dart';
import 'package:zindl_hub/services/book_service.dart';
import 'package:zindl_hub/services/weather_service.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({
    required this.weatherService,
    required this.bookService,
    HomeCubitState? initialState,
  }) : super(HomeCubitLoaded());

  WeatherService weatherService;
  BookService bookService;

  Future<void> onStartedAsync() async {
    emit(HomeCubitLoading());
    try {
      Weather? current = await weatherService.fetchCurrentWeatherAsync();
      if (current == null) {
        emit(HomeCubitError("Could not loaded"));
      } else {
        emit(HomeCubitLoaded(currentWeatherdata: current));
      }
    } catch (e) {
      emit(HomeCubitError(""));
    }
  }
}
