import 'package:flutter_app1111/src/data/models/add_book_model.dart';

abstract class AddBookState {}

class AddBookInitialState extends AddBookState{}
class AddBookLoadingState extends AddBookState{}
class AddBookSuccessState extends AddBookState{
final AddBookModel addBookModel;

  AddBookSuccessState({required this.addBookModel});
}
class AddBookErrorState extends AddBookState{
  final String error;

  AddBookErrorState({required this.error});
}