import 'package:flutter_app1111/src/data/models/get_books.dart';

import '../../../data/models/profile_model.dart';

abstract class GetProfileState{}
class GetProfileInitialState extends GetProfileState{}
class GetProfileLoadingState extends GetProfileState{}
class GetProfileSuccessState extends GetProfileState{
  final ProfileModel profileModel;

  GetProfileSuccessState({required this.profileModel});
}
class GetProfileErrorState extends GetProfileState{
  final String  error;

  GetProfileErrorState({required this.error});
}

class LogOutLoadingState extends GetProfileState{}
class LogOutSuccessState extends GetProfileState{
 final dynamic logOutMessage;

  LogOutSuccessState({required this.logOutMessage});
}
class LogOutErrorState extends GetProfileState{
  final String  error;

  LogOutErrorState({required this.error});
}