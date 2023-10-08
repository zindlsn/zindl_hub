part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitError extends HomeCubitState {
  final message;

  HomeCubitError(this.message);
}

final class HomeCubitLoaded extends HomeCubitState {
  Current? currentWeatherdata;

  HomeCubitLoaded({this.currentWeatherdata});
}


/*

class ToDoOverviewCubit extends Cubit<ToDoOverviewCubitState> {
  ToDoOverviewCubit({
    required this.loadToDoCollections,
    ToDoOverviewCubitState? initialState,
  }) : super(initialState ?? const ToDoOverviewCubitLoadingState());

  final LoadToDoCollections loadToDoCollections;

  Future<void> readToDoCollections() async {
    emit(const ToDoOverviewCubitLoadingState());
    try {
      final collectionsFuture = loadToDoCollections.call(NoParams());
      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(const ToDoOverviewCubitErrorState());
      } else {
        emit(ToDoOverviewCubitLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(const ToDoOverviewCubitErrorState());
    }
  }
}

*/
