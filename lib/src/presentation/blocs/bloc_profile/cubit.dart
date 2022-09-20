import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/states.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_profile/ststes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/profile_model.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final DioHelper dioHelper;
  GetProfileCubit({required this.dioHelper}) :super(GetProfileInitialState());

  static GetProfileCubit get(context) => BlocProvider.of(context);

  late ProfileModel profileModel;
  late String  errorState;
  getProfile(){
    emit(GetProfileLoadingState());
    DioHelper.GetProfile( url: "admin-panel/showmyprofile/").then((value) {
      print(value.data.length);
      profileModel=ProfileModel.fromJson(value.data);
      emit(GetProfileSuccessState(profileModel: profileModel));
    }).catchError((error){
      if(error.toString().contains('422') ) {
        errorState='There are no books.';
        print("error_state=${errorState}");
        emit(GetProfileErrorState(error: errorState));
      }
    });
  }
PostLogOut(){
  DioHelper.postLogOut( url: 'admin-panel/logout').then((value) {
    emit(LogOutSuccessState(logOutMessage: value.data));
  }).catchError((error){
    if(error.toString().contains('401')) {
      emit(LogOutErrorState(error:'This account has already been logged out' ));
    }

  });
}

}
