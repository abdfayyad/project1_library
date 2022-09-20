import 'package:flutter_app1111/src/data/models/all_users.dart';

abstract class AllUserStates{}
class AllUserInitialState extends AllUserStates{}
class AllUserLodingState extends AllUserStates{}
class AllUserSuccessState extends AllUserStates{
  final AllUsersModel allUsersModel;

  AllUserSuccessState({required this.allUsersModel});
}
class AllUserErrorState extends AllUserStates{
  final String ? error;

  AllUserErrorState({this.error});
}


