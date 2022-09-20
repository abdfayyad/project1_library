
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/all_users.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_increase_points/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncreasePointsCubit extends Cubit<IncreasePointsStates> {
  final DioHelper dioHelper;
  late User user;

  IncreasePointsCubit({required this.dioHelper})
      : super(IncreasePointsInitialState());

  static IncreasePointsCubit get(context) => BlocProvider.of(context);

  IncreasePoints({required int user_id, required int points}) async {
    emit(IncreasePointsLodingState());
    DioHelper.postIncreasePoints(url: 'admin-panel/re-charge/', data: {
      'user_id': user_id,
      'points': points,
    }).then((value) {
      print("*********************");
      print(value.data);
      user = User.fromJson(value.data['user']);
      print(user.points);
      emit(IncreasePointsSuccessState(user: user));
    }).catchError((error) {
      print('error');
      emit(IncreasePointsErrorState(error: 'error'));
    });
  }
}