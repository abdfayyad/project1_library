import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/add_book_model.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_addbooke/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddBookCubit extends  Cubit<AddBookState>{
  final DioHelper dioHelper;
  late AddBookModel addBookModel;
  String?  error;
  AddBookCubit({required this.dioHelper}) : super(AddBookInitialState());
  addBook({required String isbn,
 required String title,
  required String summery,
  required String price,
  required String pagesCount,
  required String numOfParts,
  required String numOfCopies,
  required String categoryId,
  required String authorId,
    required File?  coverPic,
   })async{

    emit(AddBookLoadingState());
    String imageName=coverPic!.path.split('/').last;
    FormData formData=FormData.fromMap({
      "isbn":isbn,
      "title":title,
      "summery":summery,
      "price":price,
      "pages_count":pagesCount,
      "num_of_parts":numOfParts,
      "num_of_copies":numOfCopies,
      "category_id":categoryId,
      "author_id":authorId,
      "cover_pic":await MultipartFile.fromFile(coverPic.path,filename: imageName),
    });
    DioHelper.postData(data:formData, url: 'admin-panel/books/').then((value) {
      addBookModel=AddBookModel.fromJson(value.data);
      emit(AddBookSuccessState(addBookModel: addBookModel));
    }).catchError((error){
      if(error.toString().contains('422') ) {
        error='The given data was invalid.\nThe isbn has already been taken.';
        print("error_state=${error}");
        emit(AddBookErrorState(error: error));
      }

    });
  }
  updateBook({required String isbn,
    required String title,
    required String summery,
    required String price,
    required String pagesCount,
    required String numOfParts,
    required String numOfCopies,
    required String categoryId,
    required String authorId,
    required File?  coverPic,
    required int idBookUpdate,
  })async{

    emit(AddBookLoadingState());
    String imageName=coverPic!.path.split('/').last;
    FormData formData=FormData.fromMap({
      "isbn":isbn,
      "title":title,
      "summery":summery,
      "price":price,
      "pages_count":pagesCount,
      "num_of_parts":numOfParts,
      "num_of_copies":numOfCopies,
      "category_id":categoryId,
      "author_id":authorId,
      "cover_pic":await MultipartFile.fromFile(coverPic.path,filename: imageName),
    });
    DioHelper.postData(data:formData, url: 'admin-panel/books/$idBookUpdate').then((value) {
      addBookModel=AddBookModel.fromJson(value.data);
      emit(AddBookSuccessState(addBookModel: addBookModel));
    }).catchError((error){
      if(error.toString().contains('422') ) {
        error='The given data was invalid.\nThe isbn has already been taken.';
        print("error_state=${error}");
        emit(AddBookErrorState(error: error));
      }

    });
  }
  static AddBookCubit get(context)=> BlocProvider.of(context);

}