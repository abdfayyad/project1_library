import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_shelves/states.dart';



class ShelvesCubit extends Cubit<ShelvesStates>{
  final DioHelper dioHelper;
  late GetBooksModel getBooksModel;
  ShelvesCubit({required this.dioHelper}) : super(ShelvesInitialState());
  //سهولة الاستخدام هاد الكيوبت في عدة اماكن
  static ShelvesCubit get(context) => BlocProvider.of(context);
  CategoryBooks({required int id })async{
    emit(ShelvesLodingState());
    DioHelper.GetData(url:'admin-panel/books/category/',id_book: id.toString()).then((value) {
      getBooksModel=GetBooksModel.fromJson(value.data);
      emit(ShelvesSuccessState(getBooksModel: getBooksModel));
    }).catchError((error){
      print('error');
      emit(ShelvesErrorState());
    });
  }

}