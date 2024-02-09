import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:ecommerce_shoppers/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.headLineText,
    required this.subText,
    required this.text,
    required this.emailWidget,
    required this.passwordWidget,
    required this.textButton,
    required this.buttonWidget,
    required this.onTap,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String headLineText;
  final String subText;
  final String text;
  final String textButton;
  final TextFieldWidget emailWidget;
  final TextFieldWidget passwordWidget;
  final CustomButton buttonWidget;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headlineLarge,
                children: [
                  TextSpan(
                    text: headLineText,
                  ),
                  TextSpan(
                    text: subText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ]),
          ),
        ),
        const SizedBox(height: 35),
        Container(
            width: 355,
            height: 380,
            decoration: BoxDecoration(
                boxShadow: CustomTheme.cardShadow,
                borderRadius: BorderRadius.circular(35),
                color: Colors.white),
            child: Form(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 20),
                        child: Text(
                          'Your email address',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      emailWidget,
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, bottom: 10, top: 8),
                        child: Text(
                          'Password',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      passwordWidget,
                      buttonWidget,
                    ],
                  ),
                ),
              ),
            )),
        const SizedBox(height: 30),
        // Text(
        //   'Create a new account? Sign Up',
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headlineMedium,
                children: [
                  TextSpan(
                    text: text,
                  ),
                  TextSpan(
                    text: textButton,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.amber),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
