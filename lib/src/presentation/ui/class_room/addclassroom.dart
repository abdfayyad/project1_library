import 'package:flutter/material.dart';

class addclassroom extends StatelessWidget {
  final Function addclassroomcallback;
   addclassroom(this.addclassroomcallback);

  @override
  Widget build(BuildContext context) {
    String? newclassroomtitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Table',textAlign:TextAlign.center,style: TextStyle(
            color:Colors.indigo[400],fontWeight: FontWeight.bold,

          fontSize:30, ),),
          TextField(
            autofocus:true ,
            textAlign: TextAlign.center,
            onChanged: (newtext){
              newclassroomtitle=newtext;
            },
          ),
         SizedBox(height: 30,),
          TextButton(onPressed: (){
            addclassroomcallback(newclassroomtitle);
          }
          ,child: Text('add',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),)

        ],
      ),
    );
  }
}
