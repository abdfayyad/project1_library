import 'package:flutter_app1111/src/data/models/login_model.dart';
import 'package:flutter_app1111/src/data/models/sign_in_model.dart';

abstract class SignInScreenStates{}

class SignInInitialState extends SignInScreenStates{}
class SignInLoadingState extends SignInScreenStates{}
class SignInSuccessState extends SignInScreenStates
{
  final SignInModel signInModel;

  SignInSuccessState(this.signInModel);
}
class SignInErrorState extends SignInScreenStates{
  final String ? error;
 SignInErrorState(this.error);
}
class SignInChangePasswordVisibilityState extends SignInScreenStates{}
