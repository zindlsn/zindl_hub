import 'package:flutter/material.dart';
import 'package:zindl_hub/2_application/pages/home/home_page.dart';
import 'package:zindl_hub/services/weather_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WeatherService weatherService = WeatherService();

  //print(await weatherService.fetchCurrentWeatherAsync());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePageProvider(),
    );
  }
}
