import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_shelves/cubit.dart';

import '../../blocs/bloc_shelves/states.dart';
import 'books_user.dart';


class ShelvesUser extends StatefulWidget {
  @override
  State<ShelvesUser> createState() => _ShelvesUserState();
}

class _ShelvesUserState extends State<ShelvesUser> {
  late ShelvesCubit shelvesCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shelvesCubit=ShelvesCubit(dioHelper:DioHelper());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>shelvesCubit,
        child: BlocConsumer<ShelvesCubit,ShelvesStates>(
            listener:(context, state) {
              if(state is ShelvesSuccessState)
              {

                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                  return BooksUser(books:state.getBooksModel.listBooks,);
                }));
              }
            } ,
            builder: (context ,state) {
              ShelvesCubit cubit=ShelvesCubit.get(context);
              return Scaffold(
                body: Container(
                  width: double.infinity,height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){

                            shelvesCubit.CategoryBooks(id:1);

                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:religious ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: (){
                            shelvesCubit.CategoryBooks(id:2);
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:Romantic ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            shelvesCubit.CategoryBooks(id:3);
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:Cultural ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            shelvesCubit.CategoryBooks(id:4);
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:Scientific ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            shelvesCubit.CategoryBooks(id:5);
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:Historical ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),
                                      //

                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            shelvesCubit.CategoryBooks(id:6);
                          },
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/image/books.png')),
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  height: 100,
                                  width: 80,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Type:Other ',
                                        maxLines: 2, overflow: TextOverflow.ellipsis,

                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      // const SizedBox(height: 7.0,),
                                      // Text('Publisher:Nezar Kabane',
                                      //   style: Theme.of(context).textTheme.bodyText2,),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
    );

  }
}
