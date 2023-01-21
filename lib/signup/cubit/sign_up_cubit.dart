import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneak_crib/core/widgets/reusable_button.dart';
import 'package:sneak_crib/home/pages/home_screen.dart';
import 'package:sneak_crib/signup/cubit/sign_up_cubit.dart';
import '../../../main.dart';

import '../../../login/pages/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  Widget Name() {
    return TextFormField(
      controller: nameController,
      validator: ((value) {
        if (value!.isEmpty || !RegExp(r'^[\w]+$').hasMatch(value)) {
          return "Enter your name correctly";
        } else {
          return null;
        }
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Name",
        hintText: "Name",
      ),
    );
  }

  Widget email() {
    return Container(
        child: TextFormField(
      controller: emailController,
      validator: ((value) {
        if (value!.isEmpty ||
            !RegExp(r'^[a-z A-Z]([\w]|-|[\.])*[@]{1}[a-z A-Z]{5,8}[\.]{1}[a-z A-Z]{2,3}$')
                .hasMatch(value)) {
          return "Enter your email correctly";
        } else {
          return null;
        }
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Email",
        hintText: "email@gmail.com",
      ),
    ));
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
      maxLines: 1,
      // autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        hintText: "Password",
        labelText: "Password",
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }

  Widget PhoneNumber() {
    return TextFormField(
      controller: phoneController,
      validator: ((value) {
        if (value!.isEmpty || !RegExp(r'^[\d]{11}$').hasMatch(value)) {
          return "please enter your number correctly";
        } else {
          return null;
        }
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Phone Number",
        hintText: "Enter Your Number Here",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        backgroundColor: const Color(0xff1d1f21),
      ),
      body: BlocProvider<SignUpCubit>(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is UserRegisterLoadingState) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is UserCreateSuccessState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NikeShoesHome()));
            }
          },
          builder: (context, state) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff1d1f21), Color(0xc40414)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Name(),
                        const SizedBox(
                          height: 30,
                        ),
                        email(),
                        const SizedBox(
                          height: 30,
                        ),
                        password(),
                        const SizedBox(
                          height: 30,
                        ),
                        PhoneNumber(),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is UserRegisterLoadingState,
                          builder: (context) =>
                              const CircularProgressIndicator(),
                          fallback: (context) => ReusableButton(
                            onPressed: () {
                              if (_signupFormKey.currentState!.validate()) {
                                SignUpCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Signup',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
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
}
