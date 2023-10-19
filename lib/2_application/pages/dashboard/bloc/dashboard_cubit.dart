import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/0_data/models/book.dart';
import 'package:zindl_hub/0_data/models/user.dart';
import 'package:zindl_hub/0_data/models/weather.dart';
import 'package:zindl_hub/1_domain/repositories/weather_repository.dart';

part 'dashboard_cubit_state.dart';

class DashboardCubit extends Cubit<HomeCubitState> {
  DashboardCubit({
    required this.weatherService,
    HomeCubitState? initialState,
  }) : super(HomeCubitLoaded());

  WeatherRepository weatherService;

  User loggedInUser = User("Stefan");

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

  String getWelcomeText() {
    String greetings = welcomeTextByTime();

    return "$greetings, ${loggedInUser.name}";
  }

  String welcomeTextByTime() {
    switch (DateTime.now().hour) {
      case >= 4 && < 11:
        return "Guten Morgen";
      case > 10 && < 17:
        return "Guten Tag";
      case > 16 && < 21:
        return "Guten Abend";
      default:
        return "Gute Nacht";
    }
  }
}
