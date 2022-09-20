import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/sign_in_model.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_sign_in/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;


class SignInCubit extends Cubit<SignInScreenStates>
{
  final DioHelper dioHelper;
  late SignInModel signInModel;
  String ? errorState;
  SignInCubit({required this.dioHelper}):super(SignInInitialState()) ;
  static SignInCubit get(context)=>BlocProvider.of(context);
  userSignIn(String fname,lname,address,email,phone,password,)async
  {
    emit(SignInLoadingState());
   DioHelper.postData(
       url: 'auth/sign-up',
       data:{
     'first_name':fname,
     'last_name':lname,
     'address':address,
     'phone_number':phone,
     'email':email,
     'password':password,
   }).then((value) {

     signInModel=SignInModel.fromJson(value.data);
     emit(SignInSuccessState(signInModel));
   }).catchError((error){
     if(error.toString().contains('422') ) {
       errorState='The given data was invalid.\nThe email has already been taken.';
       print("error_state=${errorState}");
       emit(SignInErrorState(errorState));
     }

   });
  }
  IconData suffix=Icons.visibility;
  bool isPasswordShow=true;
  void changePasswordVisibility(){
    isPasswordShow=!isPasswordShow;

    suffix= isPasswordShow?
    Icons.visibility:Icons.visibility_off;
    emit(SignInChangePasswordVisibilityState());
  }
}