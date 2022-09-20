import 'package:flutter/material.dart';

import 'addclassroom.dart';
import 'cobject.dart';
import 'listforclassroom.dart';

class classroom extends StatefulWidget {
  const classroom({Key? key}) : super(key: key);

  @override
  State<classroom> createState() => _classroomState();
}

class _classroomState extends State<classroom> {
  List<cobject>classrooms =[
    cobject(name:'table1'),
    cobject(name:'table2'),
    cobject(name:'table3'),
    cobject(name:'table4'),
    cobject(name:'table5'),
    cobject(name:'table6'),
    cobject(name:'table7'),
    cobject(name:'table8'),
    cobject(name:'table9'),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder:(context)=>SingleChildScrollView(child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
              child: addclassroom((newclassroomtitle){

              setState(() {
                classrooms.add(cobject(name:newclassroomtitle));
Navigator.pop(context);
              });}),
          ),
          ),
          );
        },
        backgroundColor: Colors.indigo[400],
        child:Icon(Icons.add) ,
      ) ,
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.playlist_add_check, size: 40,),
                SizedBox(width: 20,),
                Text("ClassRoom",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),),
              ],
            ),
            Text('${classrooms.length}Tables',style: TextStyle(color: Colors.black, fontSize: 18,),),

            SizedBox(height: 20,),
            Expanded(
            child: Container(
              decoration: BoxDecoration(  color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20),),),
            child: listviewclassroom(classrooms),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
