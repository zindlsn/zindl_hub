import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zindl_hub/1_domain/repositories/appinfo_service.dart';
import 'package:zindl_hub/2_application/pages/dashboard/bloc/dashboard_cubit.dart';
import 'package:zindl_hub/2_application/widgets/books/books_cubit.dart';
import 'package:zindl_hub/2_application/widgets/books/books_widget.dart';
import 'package:zindl_hub/2_application/widgets/timeview_widget.dart';
import 'package:zindl_hub/main.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WelcomeText(),
      ),
      drawer: Container(
        color: Colors.white,
        width: 300,
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('Settings'),
                  leading: const Icon(Icons.settings),
                  onTap: () {},
                ),
              ],
            ),
            const Spacer(),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Row(
                children: [
                  const Text('About'),
                  const Spacer(),
                  Consumer<AppInfoService>(
                      builder: (context, appInfoService, child) {
                    return Text("v${appInfoService.appVersion}");
                  }),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const TimeViewScreenProvider(),
                _weatherInfo(),
                const BookInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _weatherInfo() {
    return BlocBuilder<DashboardCubit, HomeCubitState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: switch (state) {
              HomeCubitInitial() => null,
              HomeCubitLoaded() => Column(
                  children: [
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                        ),
                        color: Colors.blueAccent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            state.currentWeatherdata!.current!.lastupdated ??
                                "",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                              '${state.currentWeatherdata!.current!.tempc} ° C'),
                        ],
                      ),
                    ),
                  ],
                ),
              HomeCubitLoading() => const Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Loading')],
                  ),
                ),
              HomeCubitError() => Text(state.message)
            },
          ),
        );
      },
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(context.read<DashboardCubit>().getWelcomeText());
  }
}

class DashboardPageProvider extends StatelessWidget {
  const DashboardPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardCubit>(
            create: (context) => getIt<DashboardCubit>()..onStartedAsync()),
        BlocProvider<BooksCubit>(
          create: (context) => getIt<BooksCubit>()..onStartedAsync(),
        ),
      ],
      child: const DashboardPage(),
    );
  }
}
