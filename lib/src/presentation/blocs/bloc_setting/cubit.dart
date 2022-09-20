
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_setting/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingCubit extends  Cubit<SettingState>{
  SettingCubit() : super(SettingInitialState());

  static SettingCubit get(context)=> BlocProvider.of(context);
  bool isdark=false;
  var nameLibcontroler = TextEditingController();
  var curcontroler = TextEditingController();

  var deletecontroller = TextEditingController();

  var selectedCetegury = 'english';
  var selectedCetegury1 = 'locally';

  var cetegury = ['english', 'عربي', 'System language'];
  var cetegury1 = ['locally', 'dark', 'light'];


  bool isSwitched = false;



  var textValue = 'light';

  var textValue1 = 'arabic';

void changAppMode(){
  isdark=!isdark;
 // isSwitched=!isSwitched;
  emit(SettingChangeThemState());

}
void CC(int x){
  if(x==0){
    isdark=false;
  }else if(x==1){
    isdark=true;
  }
  emit(SettingChangeThemState());
}

  // void toggleSwitch(bool value) {
  //   if (isSwitched == false) {
  //       isSwitched = true;
  //       textValue = 'dark';
  //      isdark=!isdark;
  //     print('dark');
  //   } else {
  //       isSwitched = false;
  //       textValue = 'light';
  //     print('light');
  //   }
  // }
}