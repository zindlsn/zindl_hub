import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zindl_hub/2_application/pages/dashboard/dashboard_page.dart';

var ioc = GetIt.asNewInstance();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPageProvider(),
    );
  }
}
