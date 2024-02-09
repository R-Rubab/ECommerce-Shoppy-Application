import 'dart:developer';

import 'package:ecommerce_shoppers/auth/application_state.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/auth/login_data.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:ecommerce_shoppers/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  Map<String, String> data = {};

  _LoginScreenState() {
    data = LoginData.signIn;
  }

  void switchLogin() {
    setState(() {
      if (mapEquals(data, LoginData.signUp)) {
        data = LoginData.signIn;
      } else {
        data = LoginData.signUp;
      }
    });
  }

  loginError(FirebaseAuthException e) {
    log('error');
    if (e.message != '') {
      setState(() {
        loading = false;
      });
    }
  }

 void loginButtonPressed() {
    setState(() {
      loading = true;
    });
    ApplicationState applicationState =
        Provider.of<ApplicationState>(context, listen: false);
    if (mapEquals(data, LoginData.signUp)) {
      applicationState.signUp(
          emailController.text, passwordController.text, loginError);
    } else {
      applicationState.signIn(
          emailController.text, passwordController.text, loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentState = FocusScope.of(context);
        if (currentState == primaryFocus) {
          currentState.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: [
                    TextSpan(
                      text: data['heading'],
                    ),
                    TextSpan(
                      text: data['subHeading'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ]),
            ),
            const SizedBox(height: 35),
            Center(
              child: Container(
                  width: 355,
                  height: 380,
                  decoration: BoxDecoration(
                      boxShadow: CustomTheme.cardShadow,
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white),
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 20),
                              child: Text(
                                'Your email address',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            TextFieldWidget(
                              hint: 'email@gmail.com',
                              controller: emailController,
                              onPressed: () {},
                              icon: Icons.person,
                              validator: (value) {
                                value == null ? null : 'Required Field';
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, bottom: 10, top: 8),
                              child: Text(
                                'Password',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),
                            TextFieldWidget(
                              hint: 'password',
                              controller: passwordController,
                              onPressed: () {},
                              icon: Icons.lock_clock_outlined,
                              validator: (value) {
                                value == null ? null : 'Required Field';
                                return null;
                              },
                            ),
                            CustomButton(
                                loading: loading,
                                onTap: loginButtonPressed,
                                title: data['label'].toString()),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            const SizedBox(height: 30),
            // Text(
            //   'Create a new account? Sign Up',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            InkWell(
              onTap: switchLogin,
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: [
                      TextSpan(
                        text: data['footer'],
                      ),
                      TextSpan(
                        text: data['footerText'],
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.amber),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
