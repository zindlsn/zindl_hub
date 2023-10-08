import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zindl_hub/0_data/models/weather.dart';

///
///Example restcall:
///http://api.weatherapi.com/v1/current.json?key=&q=London&aqi=no
///
///Answer:
/*{
    "location": {
        "name": "London",
        "region": "City of London, Greater London",
        "country": "United Kingdom",
        "lat": 51.52,
        "lon": -0.11,
        "tz_id": "Europe/London",
        "localtime_epoch": 1696014121,
        "localtime": "2023-09-29 20:02"
    },
    "current": {
        "last_updated_epoch": 1696013100,
        "last_updated": "2023-09-29 19:45",
        "temp_c": 16.0,
        "temp_f": 60.8,
        "is_day": 0,
        "condition": {
            "text": "Clear",
            "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
            "code": 1000
        },
        "wind_mph": 3.8,
        "wind_kph": 6.1,
        "wind_degree": 260,
        "wind_dir": "W",
        "pressure_mb": 1023.0,
        "pressure_in": 30.21,
        "precip_mm": 0.0,
        "precip_in": 0.0,
        "humidity": 68,
        "cloud": 0,
        "feelslike_c": 16.0,
        "feelslike_f": 60.8,
        "vis_km": 10.0,
        "vis_miles": 6.0,
        "uv": 1.0,
        "gust_mph": 12.1,
        "gust_kph": 19.5
    }
} */
///
///
///
///
///https://firebase.google.com/docs/storage/web/download-files?hl=de
///
///
class WeatherService {
  final String currentTemperatureBaseUrl =
      'http://api.weatherapi.com/v1/current.json?key=4dc3589a68974ee88bd222349232709&q=Stuttgart';
  final String apiV1BaseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "4dc3589a68974ee88bd222349232709";
  Future<Current?> fetchCurrentWeatherAsync() async {
    try {
      final response =
          await http.get(Uri.parse(currentTemperatureBaseUrl), headers: {
        "ACCEPT": "application/json",
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      });
      if (response.statusCode == 200) {
        return Current(tempc: 10.5);
        return Current.fromJson(json.decode(response.body));
      } else {
        return Current(tempc: 66.6);
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to get data from API');
      }
    } catch (_) {
      throw Exception('Failed to get data from API');
    }
  }
}
