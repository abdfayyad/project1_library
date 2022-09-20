import 'package:flutter/material.dart';
import 'package:flutter_app1111/main.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/presentation/blocs/blocs_user/bloc_all_user/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/blocs_user/bloc_all_user/states.dart';
import 'package:flutter_app1111/src/presentation/ui/about_application.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/subscribers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../class_room/ClassRoom.dart';
import 'members.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 late AllUserCubit allUserCubit;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allUserCubit=AllUserCubit(dioHelper:DioHelper());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      
      create: (BuildContext context)=>allUserCubit,
      child: Scaffold(
        body:MyApp.isadminn==true?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      if(MyApp.isadminn==true)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => classroom(

                              )));
                    }
                    },
                    child: Card(
                      elevation: 50,
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: 135,
                        height: 135,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[500],
                                radius: 30,
                                child:const CircleAvatar(
                                  backgroundImage: AssetImage('assets/image/halls.png'),
                                  //NetworkImage
                                  radius: 100,
                                ), //CircleAvatar
                              ), //CircleAvatar
                             const SizedBox(
                                height: 10,
                              ), //SizedBox
                              Text(
                                'Halls',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w500,
                                ), //Textstyle
                              ), //Text
                            ],
                          ), //Column
                        ), //Padding
                      ), //SizedBox
                    ),
                  ),
                 const SizedBox(width: 20.0,),
                  InkWell(
                    onTap: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (ctx) => Members(
                      //
                      //         )));
                    },
                    child: Card(
                      elevation: 50,
                      shadowColor: Colors.black,

                      child: SizedBox(
                        width: 135,
                        height: 135,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[500],
                                radius: 30,
                                child:const CircleAvatar(
                                  backgroundImage: AssetImage('assets/image/aabb.png'),
                                  //NetworkImage
                                  radius: 100,
                                ), //CircleAvatar
                              ), //CircleAvatar
                             const SizedBox(
                                height: 10,
                              ), //SizedBox
                              Text(
                                'Members',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w500,
                                ), //Textstyle
                              ), //Text
                            ],
                          ), //Column
                        ), //Padding
                      ), //SizedBox
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<AllUserCubit,AllUserStates>(
                    listener: (context, state) {
                      if(state is AllUserSuccessState)
                        Navigator.of(context).push(MaterialPageRoute(builder:(context){
                          return Subscriber(users: state.allUsersModel.users,);
                        }));
                        
              },
                    builder:(context,state)=> InkWell(
                      onTap: (){

                          AllUserCubit.get(context).AllUser();

                      },
                      child: Card(

                        elevation: 50,
                        shadowColor: Colors.black,

                        child: SizedBox(
                          width: 135,
                          height: 135,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue[500],
                                  radius: 30,
                                  child:const CircleAvatar(
                                    backgroundImage: AssetImage('assets/image/subscriber.png'),
                                    //NetworkImage
                                    radius: 100,
                                  ), //CircleAvatar
                                ), //CircleAvatar
                                const SizedBox(
                                  height: 10,
                                ), //SizedBox
                                Text(
                                  'subscriber',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.w500,
                                  ), //Textstyle
                                ), //Text
                              ],
                            ), //Column
                          ), //Padding
                        ), //SizedBox
                      ),
                    ),
                  ),
                 const SizedBox(width: 20.0,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => AboutApplication(

                              )));
                    },
                    child: Card(

                      elevation: 50,
                      shadowColor: Colors.black,
                      // color: Colors.blue[300],
                      child: SizedBox(
                        width: 135,
                        height: 135,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue[500],
                                radius: 30,
                                child:const CircleAvatar(
                                  backgroundImage: AssetImage('assets/image/about.png'),
                                  //NetworkImage
                                  radius: 100,
                                ), //CircleAvatar
                              ), //CircleAvatar
                              const SizedBox(
                                height: 10,
                              ), //SizedBox
                              Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.w500,
                                ), //Textstyle
                              ), //Text
                            ],
                          ), //Column
                        ), //Padding
                      ), //SizedBox
                    ),
                  ),
                ],
              ),



            ],
          ),
        ):
        Center(child: Text(
          'Welcome In Our Library❤️',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),),),
      ),
    );
  }
}
