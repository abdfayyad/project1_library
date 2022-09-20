import 'package:flutter/material.dart';

class addshelf extends StatelessWidget {
  final Function addshelfcallback;
  addshelf(this.addshelfcallback);

  @override
  Widget build(BuildContext context) {
    String?newshelftitle;

    return Container(
      padding: EdgeInsets.all(30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Add Shelf' , textAlign: TextAlign.center,style: TextStyle(
          color: Colors.indigo[400],fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        TextField(autofocus: true,
            textAlign: TextAlign.center,
        onChanged: (newtext){
          newshelftitle=newtext;
        },),
        SizedBox(height: 30,),
        TextButton(onPressed: (){
          addshelfcallback(newshelftitle);
        }
          ,child: Text('add',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),)
      ],
    ),
    );
  }
}
