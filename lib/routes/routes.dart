import 'package:ecommerce_shoppers/routes/routes_name.dart';
import 'package:ecommerce_shoppers/screens/card_detail.dart';
import 'package:ecommerce_shoppers/screens/checkout.dart';
import 'package:ecommerce_shoppers/screens/home.dart';
import 'package:ecommerce_shoppers/screens/profile.dart';
import 'package:ecommerce_shoppers/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
    
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      // case RoutesName.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SignUpScreen(),
      //   );
      // case RoutesName.signInScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SignInScreen(),
      //   );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.detailCardScreen:
        return MaterialPageRoute(
          builder: (context) => const DetailCardScreen(),
        );
      case RoutesName.checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Defined Routes'),
            ),
          ),
        );
    }
  }
}
