import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam_task/Models/user_model.dart';
import 'package:izam_task/Utilities/constants.dart';
import 'package:izam_task/Widgets/Auth/button_widget.dart';
import 'package:izam_task/Widgets/Auth/email_textfield.widget.dart';
import 'package:izam_task/Widgets/Auth/pass_textfield_widget.dart';

import '../../Utilities/static_functions.dart';
import 'bloc/auth_bloc.dart';
////[a-zA-Z]+[.][0-9]+@[@izam.co]

class LoginScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  UserModel user = UserModel();
  LoginScreen({super.key});
  Future<void> _saveForm(BuildContext context) async {
    _form.currentState!.validate();
    _form.currentState!.save();
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      context.read<AuthBloc>().add(loginEvent(user));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.BACKGROUND_COLOR,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginState) {
            StaticFunctions.showSuccessNote(
                context,
                "Welcome, you have logged in ${state.numberOfLogins} times with is account",
                null);
            context.read<AuthBloc>().add(InitialEvent());
          }
        },
        child: ListView(
              
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child:
               Image.asset("assets/images/Component1.png"),
            ),
            
            Center(
              child: Card(
                shadowColor: Constants.SHADOW_COLOR,
                elevation: 1,
                margin: const EdgeInsets.only(top: 15),
                child: Container(
                  width: 350,
                  height: 442,
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, top: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome, log In",
                          style: TextStyle(
                              fontSize: 28,
                              color: Constants.DARK_COLOR,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        EmailTextFieldWidget(returnValue: (value) {
                          user.email = value;
                          print(value);
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        PasswordTextFieldWidget(returnValue: (value) {
                          user.password = value;
            
                          print(value);
                        }),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Constants.DARK_COLOR,
                                      fontWeight: FontWeight.w400))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ButtonWidget(
                            title: "Login",
                            action: () {
                              _saveForm(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
