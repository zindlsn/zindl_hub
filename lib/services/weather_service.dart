import 'dart:convert';

import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:zindl_hub/0_data/models/weather.dart';
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
  Future<Root?> fetchCurrentWeatherAsync() async {
    Position position = await _determinePosition();

    try {
      final response =
          await http.get(Uri.parse(currentTemperatureBaseUrl), headers: {
        "ACCEPT": "application/json",
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      });
      if (response.statusCode == 200) {
        List<Address> addresses = await Geocoder.local
            .findAddressesFromCoordinates(
                Coordinates(position.latitude, position.longitude));

        Location location =
            Location(lat: position.latitude, lon: position.longitude);

        return Root(
            current: Current.fromJson(json.decode(response.body)),
            location: location);
      } else {
        throw Exception('Failed to get data from API');
      }
    } catch (_) {
      throw Exception('Failed to get data from API');
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
