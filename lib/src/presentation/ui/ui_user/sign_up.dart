import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1111/main.dart';
import 'package:flutter_app1111/src/data/datasources/local/cachehelper.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/books.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_user/books_user.dart';
import 'package:flutter_app1111/src/presentation/widgets/componentes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/datasources/remote/dio_helper.dart';
import '../../blocs/bloc_sign_in/cubit.dart';
import '../../blocs/bloc_sign_in/states.dart';
import '../home_page.dart';
import 'home_user.dart';
import 'login_screen.dart';

class sign_up extends StatefulWidget {
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  var formKey = GlobalKey<FormState>();
  late SignInCubit signInCubit;

  void initState() {
    // TODO: limplement initState
    signInCubit = SignInCubit(dioHelper: DioHelper());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController userFirstNameController = TextEditingController();
    TextEditingController userLastNameController = TextEditingController();
    TextEditingController userAddressController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool showPass = true;

    return BlocProvider(
      create: (BuildContext context) => signInCubit,
      child: BlocConsumer<SignInCubit, SignInScreenStates>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            SharedPref.saveData(
                    key: 'token',
                    value: state.signInModel.tokenType! +
                        ' ' +
                        state.signInModel.token!)
                .then((value) {

                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));

            });
          }
          if (state is SignInErrorState) {
            showToast(text: state.error!, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('SingIn'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: userFirstNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter User First Name Please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: ' User first name',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                hintText: 'Enter User first Name',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: userLastNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter User Last Name Please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: ' User Last name',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                hintText: 'Enter User Last Name',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: userAddressController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter User address Please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: ' User Address',
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                hintText: 'Enter User Address',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Phone Number Please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'phoneNumber',
                                prefixIcon: Icon(
                                  Icons.phone,
                                ),
                                hintText: 'Enter Phone Number',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                            controller: emailAddressController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Email Please';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                hintText: 'Enter Email Address',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },

                          obscureText: SignInCubit.get(context)
                              .isPasswordShow, //isPasswordShow,
                          decoration: InputDecoration(
                              labelText: 'password',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  SignInCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: Icon(SignInCubit.get(context).suffix),
                              ),
                              hintText: 'Enter Your Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SignInLoadingState,
                          builder: (context) => MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SignInCubit.get(context).userSignIn(
                                    userFirstNameController.text,
                                    userLastNameController.text,
                                    userAddressController.text,
                                    emailAddressController.text,
                                    phoneNumberController.text,
                                    passwordController.text);
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
                              child: Center(
                                  child: Text('SING_UP', style: TextStyle())),
                            ),
                          ),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Alreadyhaveanaccount'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.blue),
                                  ))
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.red,
                                ),
                                onPressed: () {}),
                            const SizedBox(
                              width: 30.0,
                            ),
                            IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () {}),
                            const SizedBox(
                              width: 30.0,
                            ),
                            IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                icon: const FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                ),
                                onPressed: () {}),
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
