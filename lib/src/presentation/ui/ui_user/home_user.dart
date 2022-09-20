
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/data/models/get_books.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_get_books/states.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_home/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_home/states.dart';

import '../../blocs/blocs_user/bloc_user_home/cubit.dart';
import '../../blocs/blocs_user/bloc_user_home/states.dart';
import '../searchScreen.dart';

class HomeUser extends StatefulWidget {
  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  late GetBooksCubit getBooksCubit;
  int indexBook=0;
  List<Book>? listBooks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBooksCubit=GetBooksCubit(dioHelper:DioHelper());
  }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetBooksCubit>(create:(context)=>getBooksCubit),
        BlocProvider<HomeUserCubit>(create: (context)=>HomeUserCubit()),
      ],
      child: BlocBuilder<HomeUserCubit,HomeUserStates>(
        builder: (context ,state){
          HomeUserCubit homeCubitUser= HomeUserCubit.get(context);
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

            body:indexBook==1?listBooks!=null?Books(books: listBooks,): const Center(child: CircularProgressIndicator(),):homeCubitUser.screen[homeCubitUser.currentIndex] ,
            bottomNavigationBar:  BlocConsumer<GetBooksCubit,GetBooksState>(
              listener:(context, state) {
                if(state is GetBooksSuccessState) {
                  setState(() {
                    listBooks=state.getBooksModel.listBooks;
                  });
                }
              } ,
              builder: (context,state){
                return BottomNavigationBar(
                  onTap: (index){
                    indexBook=index;
                    if(index==1)
                    {

                      GetBooksCubit.get(context).getBooks();
                    }

                    homeCubitUser.changeIndex(index);
                  },
                  currentIndex: homeCubitUser.currentIndex,


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
                      icon: Icon(Icons.wb_twighlight),
                      label: 'WishList',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),

                  ],
                );
              },
            ),
            //),



          );
        },

      ),
    );
  }
}
