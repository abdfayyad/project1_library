import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/all_users.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_increase_points/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_increase_points/states.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/add_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPointsToUser extends StatefulWidget {
  final User user;

   AddPointsToUser({Key? key,required this.user}) : super(key: key);

  @override
  State<AddPointsToUser> createState() => _AddPointsToUserState(user);
}

class _AddPointsToUserState extends State<AddPointsToUser> {
  final User user;
  int? pointsUser;
  late IncreasePointsCubit increasePointsCubit;

  _AddPointsToUserState(this.user);
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    increasePointsCubit=IncreasePointsCubit(dioHelper:DioHelper());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IncreasePointsCubit>(
      create:(context)=>increasePointsCubit ,
      child:BlocConsumer<IncreasePointsCubit,IncreasePointsStates>(
        listener: (context, state) {
          if(state is IncreasePointsSuccessState) {
             pointsUser=state.user.points;
          }
        },
        builder:(context,state)=> Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                const SizedBox(height: 20.0,),
                const CircleAvatar(
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
                                const Icon(Icons.person),
                                Text('Name:${user.firstName} ${user.lastName}',style: const TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                              ],
                            ),
                          )),
                     const SizedBox(height: 35.0,),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.email_outlined),
                                Text('Email:${user.email}',style: const TextStyle(fontSize: 17,fontWeight:FontWeight.w500, ),overflow:TextOverflow.clip,),
                              ],
                            ),
                          )),
                     const SizedBox(height: 35.0,),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.monetization_on_outlined),
                                Text('Points:${pointsUser==null?user.points:pointsUser}',style: const TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                              ],
                            ),
                          )),
                     const SizedBox(height: 35.0,),
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
                                Text('PhoneNumber:${user.phoneNumber}',style: TextStyle(fontSize: 21,fontWeight:FontWeight.w500 ),),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 60.0,),
                MaterialButton(


                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AddPoints()),
                    );
                  },
                  child:InkWell(
                    onTap: (){
                      IncreasePointsCubit.get(context).IncreasePoints(user_id:user.id!, points:1000);
                    },
                    child: Container(
                      height: 40.0,
                      width: 135,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child:const Text(
                        'AddPoints',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25.0,fontWeight: FontWeight.w700
                        ),),
                    ),
                  ),)
              ],
            ),

          ),
        ),
      ),
    );
  }
}
