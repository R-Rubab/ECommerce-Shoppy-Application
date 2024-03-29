import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color(0xFFDFDFDF);
  static const Color yellow = Color(0xffFFDB47);
  static const Color amber = Color(0xFFEBC107);
  static const cardShadow = [
    BoxShadow(
        color: CustomTheme.grey,
        spreadRadius: 4,
        blurRadius: 6,
        offset: Offset(0, 2))
  ];
  static const buttonShadow = [
    BoxShadow(
        color: CustomTheme.grey,
        spreadRadius: 4,
        blurRadius: 3,
        offset: Offset(1, 3))
  ];

  static getGridDecoration() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: CustomTheme.cardShadow,
      borderRadius: BorderRadius.circular(35),
    );
  }

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      'sm': 14,
      'md': 18,
      'lg': 24,
    };
    return ThemeData(
        primaryColor: yellow,
        fontFamily: 'DMSans',
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.yellow,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            // elevation: 10,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontFamily: 'DMSans',
                fontSize: fontSize['lg'],
                color: Colors.black,
                letterSpacing: 4,
                fontWeight: FontWeight.bold)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: fontSize['lg'],
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: fontSize['md'],
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: Colors.black,
              fontSize: fontSize['sm'],
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: fontSize['sm'], fontWeight: FontWeight.normal),
          titleSmall: TextStyle(
              fontSize: fontSize['sm'],
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ));
  }
}



// ---------------- bottom navigation bar design

    // floatingActionButton: FloatingActionButton(
    //         shape: const StadiumBorder(),
    //         backgroundColor: CustomTheme.amber,
    //         onPressed: () {},
    //         child: const Tab(icon: Icon(Icons.person)),
    //       ),
    //       floatingActionButtonLocation:
    //           FloatingActionButtonLocation.centerDocked,
    //       bottomNavigationBar: const ClipRRect(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(33), topRight: Radius.circular(33)),
    //         child: BottomAppBar(
    //           height: 60,
    //           // elevation: 10,
    //           color: CustomTheme.amber,
    //           shape: CircularNotchedRectangle(),
    //           notchMargin: 10,
    //           child: TabBar(tabs: [
    //             Tab(
    //                 icon: Icon(
    //               Icons.home,
    //             )),
    //             // Tab(icon: Icon(Icons.person)),
    //             Tab(
    //                 icon: Icon(
    //               Icons.shopping_cart,
    //             )),
    //           ]),
    //         ),
    //       ),
         