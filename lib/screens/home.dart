import 'package:ecommerce_shoppers/auth/firestore.dart';
import 'package:ecommerce_shoppers/models/product.dart';

import 'package:ecommerce_shoppers/screens/card_detail.dart';
import 'package:ecommerce_shoppers/widgets/gridcard.dart';
import 'package:ecommerce_shoppers/widgets/loader.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Future<List<Product>>? products;

    @override
    void initState() {
      super.initState();
      products = FirestoreUtil.getProducts([]);
    }
  @override
  Widget build(BuildContext context) {
    // final data = ['1', '2', '3'];
  
  onCardPress(Product product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailCardScreen(
                    product: product,
                  )));
    }
    return FutureBuilder<List<Product>>(
      future: products,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 30),
              itemBuilder: (context, index) {
                return GridViewCard(
                  product: snapshot.data![index],
                  index: index,
                  onPressed: () {
                       onCardPress(snapshot.data![index]);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const DetailCardScreen(),
                    //     ));
                    // Navigator.pushNamed(context, RoutesName.detailCardScreen);
                  }, 
                );
              },
            ),
          );
        } else {
          return const Center(child: Loader());
        }
      },
    );
  }
}
