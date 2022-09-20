

import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/login_model.dart';
import 'package:flutter_app1111/src/presentation/blocs/login_bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginCubit extends Cubit<LoginScreenStates>
{
  LoginCubit():super(LoginInitialState()) ;
 static LoginCubit get(context)=>BlocProvider.of(context);

 late LoginModel loginModel;
  String ? errorState;

  userLoginIn(email,password)async
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url:'auth/sign-in',
        data:{
      'email':email,
      'password':password,
    }).then((value) {

      loginModel=LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      if(error.toString().contains('401') ) {
        errorState="error email or password";
        emit(LoginErrorState(errorState!));
      }

    });
  }
IconData suffix=Icons.visibility;
bool isPasswordShow=true;
void changePasswordVisibility(){
  isPasswordShow=!isPasswordShow;

  suffix= isPasswordShow?
            Icons.visibility:Icons.visibility_off;
  emit(LoginChangePasswordVisibilityState());
}
}