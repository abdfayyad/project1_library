import 'package:flutter/material.dart';

class AboutApplication extends StatelessWidget {
  const AboutApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Text(
        "In this application, the admin adds details about a book so that it helps the user to know those details, and he can also interact and comment on those details.",
        style:  TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ) ,
    );
  }
}
