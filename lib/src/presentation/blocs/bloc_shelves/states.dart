import 'package:flutter_app1111/src/data/models/get_books.dart';


abstract class ShelvesStates {}

class ShelvesInitialState extends ShelvesStates{}
 class ShelvesLodingState extends ShelvesStates{}
class ShelvesSuccessState extends ShelvesStates{
  final GetBooksModel getBooksModel;

  ShelvesSuccessState({required this.getBooksModel});
}
class ShelvesErrorState extends ShelvesStates{
 final String ? error;

  ShelvesErrorState({this.error});
}