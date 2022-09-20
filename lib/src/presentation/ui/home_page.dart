
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/data/models/profile_model.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/states.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_profile/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_profile/ststes.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_home/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_home/states.dart';
import 'searchScreen.dart';

import '../widgets/drawer.dart';
import 'ui_admin/shellves.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetBooksCubit getBooksCubit;
  late  GetProfileCubit getProfileCubit;
  int indexBook=0;
  List<Book>? listBooks;
  User ?user2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooksCubit=GetBooksCubit(dioHelper:DioHelper());
    getProfileCubit=GetProfileCubit(dioHelper: DioHelper());
  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetBooksCubit>(create:(context)=>getBooksCubit),
        BlocProvider<HomeCubit>(create: (context)=>HomeCubit()),
        BlocProvider<GetProfileCubit>(create:(context)=>getProfileCubit),
      ],
      child: BlocBuilder<HomeCubit,HomeStates>(
          builder: (context ,state){
            HomeCubit homeCubit= HomeCubit.get(context);
           return   Scaffold(
                 appBar: AppBar(
                   title: const Text('My Library'),

                   actions: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ToolbarSearch()));
                          },
                          icon: Icon(Icons.search)),
                   ],
                 ),

                body:indexBook==1?listBooks!=null?
                Books(books: listBooks,):
                indexBook==4?user2!=null?Profile(user1: user2,):
                 Center(child: CircularProgressIndicator(),)
                    :homeCubit.screen[homeCubit.currentIndex]:homeCubit.screen[homeCubit.currentIndex]  ,
                bottomNavigationBar:  BlocConsumer<GetBooksCubit,GetBooksState>(
                  listener:(context, state) {
                    if(state is GetBooksSuccessState) {
                     setState(() {
                       listBooks=state.getBooksModel.listBooks;
                     });
                    }
                  } ,
                  builder: (context,state){
                    return BlocConsumer<GetProfileCubit,GetProfileState>(
                      listener: (context,state){
                      if (state is GetProfileSuccessState)
                        {
                      setState(() {
                        user2=state.profileModel.user;
                      });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (ctx) => HomePage()));
                          //
                        }

                      },
                      builder: (context,state){
                      return BottomNavigationBar(
                        onTap: (index){
                          indexBook=index;
                          if(index==1)
                            {

                              GetBooksCubit.get(context).getBooks();
                            }
                          if(index==4)
                          {
                            GetProfileCubit.get(context).getProfile();
                          }

                            homeCubit.changeIndex(index);
                        },
                        currentIndex: homeCubit.currentIndex,


                        type: BottomNavigationBarType.fixed,

                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.segment),
                            label: 'Shelves',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.book),
                            label: 'Books',

                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Home',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.wb_twighlight),
                            label: 'WishList',
                          ),


                        ],
                      );

                    }
                    );
                  },
                ),
                drawer: NavDrawer(),



           );
          },

        ),
    );
  }
}
