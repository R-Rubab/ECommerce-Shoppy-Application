import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_shoppers/auth/application_state.dart';
import 'package:ecommerce_shoppers/firebase_options.dart';
import 'package:ecommerce_shoppers/screens/checkout.dart';
import 'package:ecommerce_shoppers/screens/home.dart';
import 'package:ecommerce_shoppers/screens/login_screen.dart';
import 'package:ecommerce_shoppers/screens/profile.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // try {
    final String response =
        await rootBundle.loadString('assets/config/stripe.json');
    final data = await json.decode(response);
    Stripe.publishableKey = data["publishableKey"];
  // } catch (e) {
  //   log(e.toString());
  // }
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => Consumer<ApplicationState>(
      builder: (context, applicationStateValue, _) {
        Widget child;
        switch (applicationStateValue.loginState) {
          case ApplicationLoginState.loggedOut:
            child = const LoginScreen();
            break;
          case ApplicationLoginState.loggedIn:
            child = const MyApp();
            break;
          default:
            child = const LoginScreen();
        }
        // return child;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.getTheme(),
          home: child,
          // initialRoute: RoutesName.loginScreen,
          // onGenerateRoute: Routes.generateRoutes,
        );
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'ECommerce Shoppers',
    //   debugShowCheckedModeBanner: false,
    //   theme: CustomTheme.getTheme(),
    //   initialRoute: RoutesName.defaultTabControllerScreen,
    //   onGenerateRoute: Routes.generateRoutes,
    // );
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text('SHOPPERS'),
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: CustomTheme.cardShadow,
            ),
            child: const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.shopping_cart)),
            ]),
          ),
          body: const TabBarView(children: [
            HomeScreen(),
            ProfileScreen(),
            CheckScreen(),
          ]),
        ));
  }
}
