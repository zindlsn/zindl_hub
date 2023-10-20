import 'package:get_it/get_it.dart';
import 'package:zindl_hub/1_domain/repositories/appinfo_service.dart';
import 'package:zindl_hub/1_domain/repositories/book_repository.dart';
import 'package:zindl_hub/1_domain/repositories/weather_repository.dart';
import 'package:zindl_hub/2_application/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:zindl_hub/2_application/widgets/books/books_cubit.dart';

final getIt = GetIt.instance;

class Registry {
  static Future<void> registerAsync() async {
    _registerServices();
    _registerBlocs();
  }

  static _registerBlocs() {
    getIt.registerFactory(
        () => DashboardCubit(weatherService: getIt<WeatherRepository>()));

    getIt.registerFactory(
        () => BooksCubit(bookService: getIt<BookRepository>()));
  }

  static _registerServices() {
    getIt.registerSingleton<AppInfoService>(AppInfoService());
    getIt.registerSingleton<WeatherRepository>(WeatherRepository());
    getIt.registerSingleton<BookRepository>(BookRepository());
  }
}
