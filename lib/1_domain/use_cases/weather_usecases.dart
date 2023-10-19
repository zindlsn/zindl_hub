import 'package:zindl_hub/0_data/models/weather.dart';
import 'package:zindl_hub/1_domain/repositories/weather_repository.dart';

abstract class AWeatherUsecases {
  Future<Weather?> getWeatherDetailsAsync();
}

class WeatherUsecases extends AWeatherUsecases {
  final WeatherRepository weatherService;

  WeatherUsecases({required this.weatherService});

  @override
  Future<Weather?> getWeatherDetailsAsync() async {
    return await weatherService.fetchCurrentWeatherAsync();
  }
}
