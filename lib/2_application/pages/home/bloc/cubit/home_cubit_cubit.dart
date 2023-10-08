import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/0_data/models/weather.dart';
import 'package:zindl_hub/services/weather_service.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({
    required this.weatherService,
    HomeCubitState? initialState,
  }) : super(HomeCubitLoaded()) {
    _onStarted();
  }

  WeatherService weatherService = WeatherService();

  Future<void> _onStarted() async {
    emit(HomeCubitLoading());
    try {
      Current? current = await weatherService.fetchCurrentWeatherAsync();
      if (current == null) {
        emit(HomeCubitStateError()) {}
      } else {
        emit(HomeCubitLoaded(currentWeatherdata: current));
      }
    } catch (e) {
      emit(HomeCubitStateError(e)) {}
    }
  }
}
