import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/models/all_users.dart';
import 'package:flutter_app1111/src/presentation/blocs/blocs_user/bloc_all_user/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/datasources/remote/dio_helper.dart';


class AllUserCubit extends Cubit<AllUserStates>{
   final DioHelper dioHelper;
   late AllUsersModel allUsersModel;
  AllUserCubit({required this.dioHelper}) : super(AllUserInitialState());
   static AllUserCubit get(context) => BlocProvider.of(context);
   AllUser()async{
     emit(AllUserLodingState());
     DioHelper.GetData(url:'admin-panel/getallusers').then((value) {
       allUsersModel=AllUsersModel.fromJson(value.data);
       emit(AllUserSuccessState(allUsersModel: allUsersModel));
     }).catchError((error){
       print('error');
       emit(AllUserErrorState());
     });
   }


}


