import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/states.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_search/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final DioHelper dioHelper;
  SearchBooksCubit({required this.dioHelper}) :super(SearchBooksInitialState());

  static SearchBooksCubit get(context) => BlocProvider.of(context);

  late GetBooksModel searchBooksModel;
  late String  errorState;
  getSearch(String titles){
    emit(SearchBooksLoadingState());
    DioHelper.GetSerch( titles:titles,url: "admin-panel/books/title/").then((value) {
      print(value.data['books by this title is: '].length);
      searchBooksModel=GetBooksModel.fromJson(value.data);
      emit(SearchBooksSuccessState(searchBooksModel: searchBooksModel));
    }).catchError((error){
      if(error.toString().contains('422') ) {
        errorState='There are no books.';
        print("error_state=${errorState}");
        emit(SearchBooksErrorState(error: errorState));
      }
    });
  }
}
