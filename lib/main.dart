import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zindl_hub/1_domain/repositories/appinfo_service.dart';
import 'package:zindl_hub/2_application/pages/dashboard/dashboard_page.dart';
import 'package:zindl_hub/core/registry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Registry.registerAsync();
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
