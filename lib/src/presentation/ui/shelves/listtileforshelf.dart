import 'package:flutter/material.dart';


class listtillshelf extends StatelessWidget {


  final void Function(bool?)checkboxchange;
  final String  shelftitle;
  final bool ischecked  ;
  listtillshelf({required this.ischecked ,
    required this.shelftitle,
    required this.checkboxchange,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(shelftitle, style: TextStyle(decoration:ischecked? TextDecoration.lineThrough:null),),
      trailing:  Checkbox(
        activeColor: Colors.blue,
        value:ischecked,
        onChanged: checkboxchange,

      ),
    );
  }
}

