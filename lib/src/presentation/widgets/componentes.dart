import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultbutton({
  Color background=Colors.blue,
  double width=50,
  double radius=10.0,
  required String text,
  required Function()? onPressed
}) {
  return Container(
    width: width,

    child: MaterialButton(
      onPressed: onPressed,

      child: Text(text.toUpperCase(),
      ),

    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background,

    ),
  );
}



void showToast({required String text,required ToastStates state})=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0
    );

enum ToastStates{SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.SUCCESS:
      color=Colors.green;
      break;
    case ToastStates.ERROR:
      color=Colors.red;
      break;
    case ToastStates.WARNING:
      color=Colors.amber;
      break;
  }
  return color;
}