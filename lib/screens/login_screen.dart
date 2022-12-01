import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:university_project/BLock/login_screen/cubit.dart';

import '../BLock/login_screen/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  bool checkEmail(String email) {
    return RegExp(r'^[\w]+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xFF2BA15D),
                        letterSpacing: 2.0,
                      ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sign in by entering the information below',
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Text('Email',
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty || !checkEmail(value)) {
                              return 'Enter a correct email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: Theme.of(context).textTheme.subtitle2,
                            border: InputBorder.none,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF43405C),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text('Password',
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(
                          height: 15.0,
                        ),
                        MyField(
                            passwordController: passwordController,
                            cubit: cubit),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF2BA15D),
                              value: cubit.isChecked,
                              onChanged: (value) {
                                cubit.changeCheck(value!);
                              },
                            ),
                            Text(
                              'Remember me',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password?',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(50.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print('hello world');
                                }
                              },
                              color: Color(0xFF2BA15D),
                              child: Text(
                                'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\t have an account?',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xFF2BA15D),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyField extends StatelessWidget {
  const MyField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.validtator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.suffixOnPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final Function(String?)? validtator;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'password must\t not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        border: InputBorder.none,
        filled: true,
        prefixIcon: Icon(
          prefixIcon,
          color: Color(0xFF43405C),
        ),
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            suffixIcon,
            color: Color(0xFF43405C),
          ),
        ),
      ),
    );
  }
}
