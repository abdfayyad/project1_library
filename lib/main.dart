import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1111/src/data/datasources/local/cachehelper.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_setting/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_setting/state.dart';
import 'package:flutter_app1111/src/presentation/ui/home_page.dart';
import 'package:flutter_app1111/src/presentation/ui/inimation_screen.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/login_screen.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  Widget  widget=WelcomeScreen();
  runApp(MyApp(startWidget: widget,));

}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  static String  nameFirstAdmin='Lana';
  static String  nameLastAdmin='Essa';
  static String emailAdmin='lanaessa15@gmail.com';
  static bool isadminn=false;

  MyApp({Key? key,required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SettingCubit(),
        child: BlocConsumer<SettingCubit, SettingState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              SettingCubit settingCubit = SettingCubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primaryColor: Colors.white,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark),
                      backgroundColor: Colors.white,
                      elevation: 1.0,
                      iconTheme: IconThemeData(color: Colors.black),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0,
                    backgroundColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          color: Colors.black),
                      bodyText2: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  cardColor: Colors.white
                ),
                darkTheme: ThemeData(
                  primaryColor: Colors.white,
                  scaffoldBackgroundColor: HexColor('333739'),

                  appBarTheme: AppBarTheme(
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: HexColor('333739'),
                      elevation: 1.0,
                      iconTheme: IconThemeData(color: Colors.white),
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0,
                    backgroundColor: HexColor('333739'),
                    unselectedItemColor: Colors.grey,
                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          color: Colors.white),
                      bodyText2: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  cardColor: Colors.black26,
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: TextStyle(color:Colors.white70 ),
                    fillColor: Colors.white,
                        iconColor: Colors.white,
                    focusColor: Colors.white,
                      hoverColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.white,

                      )
                  )
                ),
                themeMode:ThemeMode.system,
                home: startWidget,
              );
            }));
  }
}


