import 'package:ecommerce_shoppers/routes/routes_name.dart';
import 'package:ecommerce_shoppers/widgets/account_widget.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:ecommerce_shoppers/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
        body: AccountWidget(
          emailController: emailController,
          passwordController: passwordController,
          headLineText: 'Get Started!\n',
          subText: 'Create an account to continue',
          text: 'Already have an account? ',
          textButton: 'Sign In',
          emailWidget: TextFieldWidget(
            hint: 'email@gmail.com',
            controller: emailController,
            onPressed: () {},
            icon: Icons.person,
            validator: (value) {
              value == null ? null : 'Required Field';
              return null;
            },
          ),
          passwordWidget: TextFieldWidget(
            hint: 'password',
            controller: passwordController,
            onPressed: () {},
            icon: Icons.lock_clock_outlined,
            validator: (value) {
              value == null ? null : 'Required Field';
              return null;
            },
          ),
          buttonWidget: CustomButton(onTap: () {
            Navigator.pushNamed(context, RoutesName.homeScreen);
          }, title: 'SIGN Up'),
          onTap: () { 
            // Navigator.pushNamed(context, RoutesName.signInScreen);
            }
          ),
        ),
      
    );
  }
}




// =======   ===============       ==================
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
        body: AccountWidget(
          emailController: emailController,
          passwordController: passwordController,
          headLineText: 'Welcome back!\n',
          subText: 'Use your account email and password',
          text: 'Create a new account? ',
          textButton: 'Sign Up',
          onTap: () {
            // Navigator.pushNamed(context, RoutesName.signUpScreen);
          },
          emailWidget: TextFieldWidget(
            hint: 'email@gmail.com',
            controller: emailController,
            onPressed: () {},
            icon: Icons.person,
            validator: (value) {
              value == null ? null : 'Required Field';
              return null;
            },
          ),
          passwordWidget: TextFieldWidget(
            hint: 'password',
            controller: passwordController,
            onPressed: () {},
            icon: Icons.lock_clock_outlined,
            validator: (value) {
              value == null ? null : 'Required Field';
              return null;
            },
          ),
          buttonWidget: CustomButton(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.homeScreen);
              },
              title: 'SIGN IN'),
          
        ),
      ),
    );
  }
}
