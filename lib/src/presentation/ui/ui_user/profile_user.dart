import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/add_points.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
           const SizedBox(height: 20.0,),
            CircleAvatar(
              backgroundImage:AssetImage('assets/image/proo.jpg') ,
              radius: 100,
            ),
           const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                            Text('Name:FirstName&&LastName',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
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
                            Icon(Icons.email_outlined),
                            Text('Email:lanaessa@gmail.com',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
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
                            Icon(Icons.monetization_on_outlined),
                            Text('Points:70000',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
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
                            Text('PhoneNumber:0936457896',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                          ],
                        ),
                      )),
                ],
              ),
            ),
           const SizedBox(height: 60.0,),
            MaterialButton(


              onPressed: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) =>  AddPoints()),
                //);
              },
              child: Container(
                height: 40.0,
                width: 130,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Text(
                  'LogOut',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,fontWeight: FontWeight.w700
                  ),),
              ),)
          ],
        ),

    );
  }
}
