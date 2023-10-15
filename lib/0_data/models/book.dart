import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String coverUrl;
  final String description;

  const Book(this.title, this.coverUrl, this.description);

  @override
  List<Object?> get props => [title];
}
