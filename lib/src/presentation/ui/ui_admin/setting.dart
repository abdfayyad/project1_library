// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:toggle_switch/toggle_switch.dart';
//
// import '../../blocs/bloc_setting/cubit.dart';
// import '../../blocs/bloc_setting/state.dart';
//
// class Setting extends StatelessWidget {
//   static ThemeMode theme=ThemeMode.light;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => SettingCubit(),
//         child: BlocConsumer<SettingCubit, SettingState>(
//             listener: (context, state) {
//               if(state is SettingChangeThemState )
//               {
//                 if(SettingCubit.get(context).isdark==true)
//                   theme=ThemeMode.dark;
//                 else{
//                   theme=ThemeMode.light;
//                 }
//                 print(theme);
//               }
//             },
//             builder: (context, state) {
//               SettingCubit settingCubit = SettingCubit.get(context);
//               return Scaffold(
//                 appBar: AppBar(
//                   title: Text(
//                     'Sitting',
//                   ),
//                 ),
//                 body: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextFormField(
//                             // controller:   nameLibcontroler,
//                             initialValue: 'My Library',
//                             keyboardType: TextInputType.text,
//                             onFieldSubmitted: (va) {
//                               print(va);
//                             },
//                             onChanged: (String value) {
//                               print(value);
//                             },
//                             decoration: InputDecoration(
//                               labelText: 'name library',
//                               prefixIcon: Icon(
//                                 Icons.home,
//                               ),
//                             )),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         TextFormField(
//                           // controller: curcontroler,
//                           initialValue: '\$',
//                           keyboardType: TextInputType.text,
//                           onFieldSubmitted: (va) {
//                             print(va);
//                           },
//                           onChanged: (String value) {
//                             print(value);
//                           },
//                           decoration: InputDecoration(
//                             labelText: 'Currency symbol',
//                             prefixIcon: Icon(
//                               Icons.monetization_on_sharp,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.language),
//                                 SizedBox(
//                                   width: 5.0,
//                                 ),
//                                 Text('language'),
//                               ],
//                             ),
//                             DropdownButton(
//                                 value: settingCubit.selectedCetegury,
//                                 icon: const Icon(
//                                   Icons.keyboard_arrow_down,
//                                 ),
//                                 items: settingCubit.cetegury
//                                     .map((String cetegury) {
//                                   return DropdownMenuItem(
//                                     value: cetegury,
//                                     child: Text(cetegury),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   settingCubit.selectedCetegury = newValue!;
//                                 }),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.wb_twighlight),
//                                 SizedBox(
//                                   width: 5.0,
//                                 ),
//                                 Text('theme'),
//                                 Text(
//                                   '      ${settingCubit.textValue}',
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 ToggleSwitch(
//                                   minWidth: 90.0,
//                                   cornerRadius: 20.0,
//                                   activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
//                                   activeFgColor: Colors.white,
//                                   inactiveBgColor: Colors.grey,
//                                   inactiveFgColor: Colors.white,
//                                   initialLabelIndex: 1,
//                                   totalSwitches: 2,
//                                   labels: ['True', 'False'],
//                                   radiusStyle: true,
//                                   onToggle: (index) {
//                                     print(index);
//                                    settingCubit.CC(index!);
//                                   },
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         // Divider(
//                         //   color: Colors.grey,
//                         // ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'do you want to delete your library',
//                             ),
//                             MaterialButton(
//                               color: Colors.white70,
//                               onPressed: () {
//                                 //  if (formkey2.currentState!.validate()) {
//
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => deletecontroller.clear(),
//                                 //   ),
//                                 // );
//                                 //  }
//                               },
//                               child: const Text(
//                                 'delete',
//                                 style: const TextStyle(
//                                     //color: Colors.grey, //fontSize: 20,fontWeight: FontWeight.bold,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
