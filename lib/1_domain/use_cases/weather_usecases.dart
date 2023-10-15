import 'package:zindl_hub/0_data/models/weather.dart';
import 'package:zindl_hub/services/weather_service.dart';

abstract class AWeatherUsecases {
  Future<Weather?> getWeatherDetailsAsync();
}

class WeatherUsecases extends AWeatherUsecases {
  final WeatherService weatherService;

  WeatherUsecases({required this.weatherService});

  @override
  Future<Weather?> getWeatherDetailsAsync() async {
    return await weatherService.fetchCurrentWeatherAsync();
  }
}
