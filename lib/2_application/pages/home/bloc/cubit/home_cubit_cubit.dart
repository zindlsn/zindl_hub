import 'package:flutter/material.dart';
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
  }) : super(HomeCubitLoaded()) {
    _onStarted();
  }

  WeatherService weatherService;
  BookService bookService;

  Future<void> _onStarted() async {
    emit(HomeCubitLoading());
    try {
      Root? current = await weatherService.fetchCurrentWeatherAsync();
      List<Book> books = bookService.books;
      if (current == null) {
        emit(HomeCubitStateError()) {}
      } else {
        emit(HomeCubitLoaded(currentWeatherdata: current, listOfBooks: books));
      }
    } catch (e) {
      emit(HomeCubitStateError(e)) {}
    }
  }
}
