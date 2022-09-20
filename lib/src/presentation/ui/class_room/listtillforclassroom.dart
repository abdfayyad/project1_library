import 'package:flutter/material.dart';

class listtillclassroom extends StatelessWidget {


final void Function(bool?)checkboxchange;
final String  classroomtitle;
  final bool ischecked  ;
  listtillclassroom({required this.ischecked ,
    required this.classroomtitle,
    required this.checkboxchange,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(classroomtitle, style: TextStyle(decoration:ischecked? TextDecoration.lineThrough:null),),
      trailing:  Checkbox(
    activeColor: Colors.blue,
    value:ischecked,
    onChanged: checkboxchange,

    ),
    );
  }
}

