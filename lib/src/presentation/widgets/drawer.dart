import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/datasources/remote/dio_helper.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_profile/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/bloc_profile/ststes.dart';
import 'package:flutter_app1111/src/presentation/ui/inimation_screen.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/profile_model.dart';
import '../ui/ui_user/login_screen.dart';


class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  late GetProfileCubit getProfileCubit;
  User ?user2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileCubit=GetProfileCubit(dioHelper: DioHelper());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GetProfileCubit(dioHelper: DioHelper()),
      child: BlocConsumer<GetProfileCubit,GetProfileState>(
        listener: (context,state){
          if (state is GetProfileSuccessState)
          {
            setState(() {
              user2=state.profileModel.user;
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => Profile(user1: user2,)));
            //
          }

        },
        builder: (context,state)
        {
          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.account_circle, color: Colors.white, size: 40,),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            "My Library",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text("My Profile"),
                  leading: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {

                    },
                  ),
                  onTap: ()
                  {
                    GetProfileCubit.get(context).getProfile();

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => Profile()));
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("LogOut"),
                  leading: IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {

                    },
                  ),
                  onTap: ()
                  {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.QUESTION,
                      title: 'LogOut',
                      desc: 'Do you LogOut?',
                      btnOkOnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>WelcomeScreen()));
                      },
                    ).show();
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => Setting()));
                  },
                ),
              ],
            ),
          );
        },
      ),


    );
  }
}
// int _selectedIndex = 0;
// List<String> _titles = ["Home", "Profile", "Shop"];
// List<Widget> _items = [
//   Text(
//     'Index 0: Home',
//   ),
//   Text(
//     'Index 1: Profile',
//   ),
//   Text(
//     'Index 2: Shop',
//   ),
// ];
//
// abstract class showBottomNav extends Widget {
//
//
//   // ignore: non_constant_identifier_names
//   return BottomNavigationBar(
//     items: const [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.add_chart),
//         label: 'Add Manual',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.qr_code_scanner),
//         label: 'Scan ISBN',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.search),
//         label: 'Search Online',
//       ),
//     ],
//     selectedItemColor: Colors.deepOrange,
//     unselectedItemColor: Colors.grey,
//     unselectedFontSize: 15,
//     onTap: _onTap,
//   );
// }
// void _onTap(int index)
// {
//   _selectedIndex = index;
//
//}