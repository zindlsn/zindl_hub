import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/2_application/pages/home/TimeView_screen.dart';
import 'package:zindl_hub/2_application/pages/home/bloc/cubit/home_cubit_cubit.dart';
import 'package:zindl_hub/2_application/pages/home/cubit/books_cubit.dart';
import 'package:zindl_hub/services/book_service.dart';
import 'package:zindl_hub/services/weather_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [TimeViewScreenProvider(), _tempInfo(), _bookInfo()],
        ),
      ),
    );
  }

  Widget _bookInfo() {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: switch (state) {
              BooksInitial() => Container(),
              BooksLoaded() => _bookElement(state),
              BooksLoading() => const CircularProgressIndicator(),
              BooksCubitStateError() => const Text('Books could not be loaded'),
            },
          ),
        );
      },
    );
  }

  Widget _bookElement(BooksLoaded state) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
        ),
        color: Colors.blueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(state.books.first!.title),
            Image.network(
              state.books.first!.coverUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Failed to load image');
              },
            ),
            Text(state.books.first!.description),
          ],
        ),
      ),
    );
  }

  Widget _tempInfo() {
    return BlocBuilder<HomeCubit, HomeCubitState>(
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

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit(
                  weatherService: WeatherService(),
                  bookService: BookService(),
                )..onStartedAsync()),
        BlocProvider<BooksCubit>(
          create: (context) =>
              BooksCubit(bookService: BookService())..onStartedAsync(),
        )
      ],
      child: const HomePage(),
    );
  }
}
