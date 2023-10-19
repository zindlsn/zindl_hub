part of 'dashboard_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitError extends HomeCubitState {
  String message;

  HomeCubitError(this.message);
}

final class HomeCubitLoaded extends HomeCubitState {
  final Weather? currentWeatherdata;
  final List<Book>? listOfBooks;
  Book? latestBook;

  HomeCubitLoaded({this.currentWeatherdata, this.listOfBooks}) {
    latestBook = listOfBooks != null ? listOfBooks!.first : null;
  }
}