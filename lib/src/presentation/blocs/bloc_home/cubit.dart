

import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/models/profile_model.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/members.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_home/states.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/profile.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/shellves.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/wishlist.dart';

import '../../ui/ui_admin/add_book.dart';
import '../../ui/ui_admin/home.dart';
import '../../widgets/qr_code.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

//سهولة الاستخدام هاد الكيوبت في عدة اماكن
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;

  List<Widget> screen = [
    Shelves(),
    Books(),
    Home(),
    WishList(),


  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavBarState());
  }
}
