import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/presentation/blocs/login_bloc/cubit.dart';
import 'package:flutter_app1111/src/presentation/blocs/login_bloc/states.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/home_user.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/sign_up.dart';
import 'package:flutter_app1111/src/presentation/widgets/componentes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';
import '../../../data/datasources/local/cachehelper.dart';
import '../home_page.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit loginCubit;
  var formKey=GlobalKey<FormState>();
@override
  void initState() {
    // TODO: limplement initState
  loginCubit=LoginCubit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var emilController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => loginCubit,
      child: BlocConsumer<LoginCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            SharedPref.saveData(
                key: 'token',
                value: state.loginModel.tokenType! +
                    ' ' +
                    state.loginModel.token!)
                .then((value) {
                  print(SharedPref.getData(key: 'token'));
              if (MyApp.nameFirstAdmin == state.loginModel.user!.firstName &&
                  MyApp.nameLastAdmin == state.loginModel.user!.lastName &&
                  MyApp.emailAdmin == state.loginModel.user!.email) {
                MyApp.isadminn=true;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));
              } else {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));
              }
            });
          }
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key:formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                            controller: emilController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (va) {
                              print(va);
                            },

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'emil address must not be embty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                hintText: 'Enter Your Emil Address',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          onFieldSubmitted: (va) {
                            print(va);
                          },
                          // onChanged: (String value) {
                          //   print(value);
                          // },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },

                          obscureText:LoginCubit.get(context).isPasswordShow, //isPasswordShow,
                          decoration: InputDecoration(
                              labelText: 'password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),

                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context).changePasswordVisibility();
                                },
                                icon:Icon( LoginCubit.get(context).suffix),

                              ),

                              hintText: 'Enter Your Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition:state is! LoginLoadingState ,
                          builder: (context)=>
                              MaterialButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
                                    LoginCubit.get(context).userLoginIn(
                                        emilController.text,
                                        passwordController.text
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  height: 40.0,
                                  width: 100.0,
                                  child:
                                  Center(child: Text('LOGIN', style: TextStyle())),
                                ),
                              ),
                          fallback: (context)=>CircularProgressIndicator(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('don\'t have an acount?'),
                            TextButton(onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => sign_up(),
                                ),
                              );
                            }, child: Text('SIGN IN'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
