import 'package:flutter_app1111/src/data/models/all_users.dart';

abstract class IncreasePointsStates{}
class IncreasePointsInitialState extends IncreasePointsStates{}
class IncreasePointsLodingState extends IncreasePointsStates{}
class IncreasePointsSuccessState extends IncreasePointsStates{
  final User user;

  IncreasePointsSuccessState({required this.user});
}
class IncreasePointsErrorState extends IncreasePointsStates{
  final String ? error;

  IncreasePointsErrorState({this.error});
}