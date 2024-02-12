import 'package:ecommerce_shoppers/auth/application_state.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    bool loading = false;
    signOutButtonPressed() async{
      setState(() {
        loading = true;
      });
      Provider.of<ApplicationState>(context, listen: false).signOut();
    }

  @override
  Widget build(BuildContext context) {
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Hey! There',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        CustomButton(
          loading: loading,
          onTap: signOutButtonPressed
          // Navigator.pushNamed(context, RoutesName.loginScreen);
          ,
          title: 'SIGN Out',
        ),
      ],
    );
  }
}
