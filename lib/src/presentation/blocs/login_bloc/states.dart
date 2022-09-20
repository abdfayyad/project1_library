import 'package:flutter_app1111/src/data/models/login_model.dart';

abstract class LoginScreenStates{}

class LoginInitialState extends LoginScreenStates{}
class LoginLoadingState extends LoginScreenStates{}
class LoginSuccessState extends LoginScreenStates
{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginScreenStates{
  final String error;
  LoginErrorState(this.error);
}
class LoginChangePasswordVisibilityState extends LoginScreenStates{}
