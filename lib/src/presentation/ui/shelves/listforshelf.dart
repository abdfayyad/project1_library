import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/ui/shelves/shelfobject.dart';

import 'listtileforshelf.dart';

class   listviewshelf extends StatefulWidget {
  final List<shelfobject>list2;
  listviewshelf(this.list2);
  @override
  State<listviewshelf> createState() => _listviewshelfState();
}

class _listviewshelfState extends State<listviewshelf> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list2.length,
      itemBuilder: (context , index ){
        return listtillshelf(
            ischecked: widget.list2[index].isdone,
            shelftitle: widget.list2[index].name,
            checkboxchange:( newvalue) {
              setState(() {
                widget.list2[index].donechange();
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
