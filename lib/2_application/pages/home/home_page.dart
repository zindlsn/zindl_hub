import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/2_application/pages/home/bloc/cubit/home_cubit_cubit.dart';
import 'package:zindl_hub/services/book_service.dart';
import 'package:zindl_hub/services/weather_service.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
          weatherService: WeatherService(), bookService: BookService()),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: switch (state) {
                  HomeCubitInitial() => Container(),
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
                              const Text(
                                'Stuttgart',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                  '${state.currentWeatherdata!..current!.tempc} ° C'),
                            ],
                          ),
                        ),
                        state.listOfBooks != null &&
                                state.listOfBooks!.isNotEmpty
                            ? Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  ),
                                  color: Colors.blueAccent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      state.latestBook!.title,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Image.network(state.latestBook!.coverUrl),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  HomeCubitLoading() => const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Loading')
                        ],
                      ),
                    ),
                  HomeCubitError() => Text(state.message)
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
