import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zindl_hub/2_application/widgets/books/books_cubit.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 200,
          ),
          Text(state.books.first!.description),
        ],
      ),
    ),
  );
}
