import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/wishlist.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/profile_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/ui_user/books_user.dart';
import '../../../ui/ui_user/shelves_user.dart';
import 'states.dart';

class HomeUserCubit extends Cubit<HomeUserStates> {
  HomeUserCubit() : super(HomeUserInitialState());

//سهولة الاستخدام هاد الكيوبت في عدة اماكن
  static HomeUserCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screen = [
    ShelvesUser(),
    BooksUser(),
    WishList(),
   ProfileUser(),

  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeUserChangeBottomNavBarState());
  }
}