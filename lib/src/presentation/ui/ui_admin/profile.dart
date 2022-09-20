import 'package:flutter/material.dart';

import '../../../data/models/profile_model.dart';



class Profile extends StatelessWidget {
    final  User? user1;
 Profile({Key? key,  this.user1}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body:  user1==null?Center(child: const CircularProgressIndicator(),):
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 20.0,),
            CircleAvatar(
              backgroundImage:AssetImage('assets/image/proo.jpg') ,
              radius: 100,
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              Text('${user1!.firstName} ${user1!.lastName}',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                            ],
                          ),
                        )),
                    SizedBox(height: 35.0,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.email_outlined),
                                Text('${user1!.email}',style: TextStyle(fontSize: 19,fontWeight:FontWeight.w500 ),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(height: 35.0,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              Text('Points:${user1!.points}',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                            ],
                          ),
                        )),
                    SizedBox(height: 35.0,),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              Text('PhoneNumber:${user1!.phoneNumber}',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
