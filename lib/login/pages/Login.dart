import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneak_crib/core/widgets/reusable_button.dart';
import 'package:sneak_crib/home/presentation/pages/home_screen.dart';
import 'package:sneak_crib/login/presentation/cubit/login_cubit.dart';
import 'package:sneak_crib/login/presentation/cubit/login_state.dart';
import '../../../signup/presentation/pages/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Widget email() {
    return TextFormField(
      //  autovalidateMode: AutovalidateMode.always,
      controller: emailController,
      validator: ((value) {
        if (value!.isEmpty ||
            !(RegExp(
                    r'^[a-z A-Z]([\w]|-|[\.])*[@]{1}[a-z A-Z]{5,8}[\.]{1}[a-z A-Z]{2,3}$')
                .hasMatch(value))) {
          return "Enter Correct Email";
        } else {
          return null;
        }
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Name@gmail.com",
        labelText: "Email",
      ),
    );
  }

  Widget password() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value.length < 8) {
          return ("Enter Correct Password");
        } else {
          return null;
        }
      },
      controller: passwordController,
      // autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xff1d1f21),
      ),
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is UserLoginSuccessState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NikeShoesHome()));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.white, Colors.white38])),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/extra/logo.png",
                            height: 200,
                            width: double.infinity,
                          ),
                          email(),
                          const SizedBox(
                            height: 20,
                          ),
                          password(),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is UserLoginLoadingState,
                            builder: (context) =>
                                const CircularProgressIndicator(),
                            fallback: (context) => SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ReusableButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'Login',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      NavigateToSignUp(context);
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                const SizedBox(
                                  width: 90,
                                ),
                                /* TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forget Password",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),*/
                              ],
                            ),
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
      ),
    );
  }

  void NavigateToSignUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
