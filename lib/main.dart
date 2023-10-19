import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:zindl_hub/1_domain/repositories/appinfo_service.dart';
import 'package:zindl_hub/1_domain/repositories/book_repository.dart';
import 'package:zindl_hub/1_domain/repositories/weather_repository.dart';
import 'package:zindl_hub/2_application/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:zindl_hub/2_application/pages/dashboard/dashboard_page.dart';
import 'package:zindl_hub/2_application/widgets/books/books_cubit.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<AppInfoService>(AppInfoService());
  getIt.registerSingleton<WeatherRepository>(WeatherRepository());
  getIt.registerSingleton<BookRepository>(BookRepository());
  getIt.registerFactory(
      () => DashboardCubit(weatherService: getIt<WeatherRepository>()));

  getIt.registerFactory(() => BooksCubit(bookService: getIt<BookRepository>()));

  await getIt<AppInfoService>().initAsync();

  runApp(ChangeNotifierProvider(
    create: (context) => getIt<AppInfoService>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPageProvider(),
    );
  }
}
