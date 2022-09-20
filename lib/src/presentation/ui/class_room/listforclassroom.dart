import 'package:flutter/material.dart';

import 'cobject.dart';
import 'listtillforclassroom.dart';

class   listviewclassroom extends StatefulWidget {
final List<cobject>list1;
listviewclassroom(this.list1);
  @override
  State<listviewclassroom> createState() => _listviewclassroomState();
}

class _listviewclassroomState extends State<listviewclassroom> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list1.length,
      itemBuilder: (context , index ){
      return listtillclassroom(
        ischecked: widget.list1[index].isdone,
        classroomtitle: widget.list1[index].name,
        checkboxchange:( newvalue) {
          setState(() {
            widget.list1[index].donechange();
          });
        }
      );
    },);
    // return ListView(
    //   children: [
    //     listtillclassroom( classroomtitle: classrooms[0].name, ischecked: classrooms[0].isdone,),
    //     listtillclassroom( classroomtitle: classrooms[1].name, ischecked: classrooms[1].isdone,),
    //     listtillclassroom( classroomtitle: classrooms[2].name, ischecked: classrooms[2].isdone,),
    //   ],
    // ) ;
  }
}
