import 'package:flutter_app1111/src/data/models/get_books.dart';

abstract class GetBooksState{}
class GetBooksInitialState extends GetBooksState{}
class GetBooksLoadingState extends GetBooksState{}
class GetBooksSuccessState extends GetBooksState{
final GetBooksModel getBooksModel;

  GetBooksSuccessState({required this.getBooksModel});
}
class GetBooksErrorState extends GetBooksState{
 final String  error;

  GetBooksErrorState({required this.error});
}