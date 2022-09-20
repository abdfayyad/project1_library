import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/subscribers.dart';
List<userModel> listusers = [
  //userModel(name:"lilian kabool", email: "0968265914@gnaoknd"),
  userModel(name: "ghaith kabool", email: "qwpl.,kjhgfsfkjhbvc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
  userModel(name: "lipoiu", email: "qwertyudldmc"),
];

class userModel {
  final String name;
  final String email;

  userModel({required this.name, required this.email});
}

class Members extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.builder(
        itemCount: listusers.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(

            children: [
              Container(
                padding: const EdgeInsets.all(10),
                //  color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                    border: Border.all(color: Colors.grey,
                                    )
                                ),child: Icon(Icons.person)),
                            SizedBox(width: 20.0,),
                            Text(
                              '${listusers[index].name}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          '${listusers[index].email}',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          border: Border.all(color: Colors.grey,
                          )
                      ),
                      // color: Colors.white,
                      // alignment: Alignment.center ,
                      //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      child: FlatButton(
                        //backgroundColor: Colors.blueGrey[200],
                        onPressed: () {
                          // Navigator.push(context,  MaterialPageRoute(
                          //   builder: (context) =>Subscriber(), //////////Participants(listusers: [],),
                          // ),);

                        },
                        child: Text(
                          '+ ADD',
                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );

  }


// Widget biuldItem (userModel model)=> Container(
// //width: MediaQuery.of(context).size.width,
// padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Column(
// children: [
// Text(' ${model.name}',
// style: TextStyle(
// fontSize: 20.0,
// fontStyle: FontStyle.normal,
// fontWeight: FontWeight.bold,
//
// ),),
// SizedBox(
//
// height: 10.0,
// ),
// Text(
// ' ${model.email}',
// style: TextStyle(
// color: Colors.grey,
// fontStyle: FontStyle.italic
// ),
// ),
// ],
// )
// ],
// ),
//
// ],
// ),
// );
}
