import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBooksCubit extends Cubit<GetBooksState> {
  final DioHelper dioHelper;
  GetBooksCubit({required this.dioHelper}) :super(GetBooksInitialState());

  static GetBooksCubit get(context) => BlocProvider.of(context);

  late GetBooksModel getBooksModel;
  late String  errorState;
  getBooks({String? idBook}){
    emit(GetBooksLoadingState());
    DioHelper.GetData( id_book:idBook,url: "admin-panel/books/").then((value) {
      print(value.data['books'].length);
      getBooksModel=GetBooksModel.fromJson(value.data);
      emit(GetBooksSuccessState(getBooksModel: getBooksModel));
    }).catchError((error){
      if(error.toString().contains('422') ) {
        errorState='There are no books.';
        print("error_state=${errorState}");
        emit(GetBooksErrorState(error: errorState));
      }
    });
  }
}
