import 'package:ecommerce_shoppers/routes/routes_name.dart';
import 'package:ecommerce_shoppers/screens/card_detail.dart';
import 'package:ecommerce_shoppers/widgets/gridcard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ['1', '2', '3'];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 30),
        itemBuilder: (context, index) {
          return GridViewCard(
            index: index,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailCardScreen(),
                  ));
              // Navigator.pushNamed(context, RoutesName.detailCardScreen);
            },
          );
        },
      ),
    );
  }
}
