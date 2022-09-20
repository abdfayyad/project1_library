import 'package:flutter_app1111/src/data/models/get_books.dart';

abstract class SearchBooksState{}
class SearchBooksInitialState extends SearchBooksState{}
class SearchBooksLoadingState extends SearchBooksState{}
class SearchBooksSuccessState extends SearchBooksState{
  final GetBooksModel searchBooksModel;

  SearchBooksSuccessState({required this.searchBooksModel});
}
class SearchBooksErrorState extends SearchBooksState{
  final String  error;

  SearchBooksErrorState({required this.error});
}