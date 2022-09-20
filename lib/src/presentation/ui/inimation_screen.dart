
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/ui/home_page.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/home_user.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/login_screen.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/datasources/local/cachehelper.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> bottomContainerAnimation;
  late AnimationController _controller;
 // String token=CacheHelper.getData(key: "token");

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    bottomContainerAnimation =
    Tween<double>(begin: -400, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
     // backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/books.png', height: 400, width: 500),
               const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: bottomContainerAnimation.value,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration:const BoxDecoration(
                color: Colors.blue,
                /*gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.orange.shade300,
                    Theme.of(context).primaryColor,
                    //Theme.of(context).accentColor,
                    Colors.red.shade400,
                  ],
                ),*/
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.black,
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                   const SizedBox(height: 20),
                   const Text(
                      "In this application, the admin adds details about a book so that it helps the user to know those details, and he can also interact and comment on those details.",
                      style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                   const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (BuildContext context) => sign_up()),
                            );


                          },
                          child: Container(
                            height:40,
                            width: 100.0,

                            child:const Center(
                              child: Text(
                                'LogIn',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black,

                                    fontWeight: FontWeight.bold,fontSize: 20.0),
                              ),),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white70
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}