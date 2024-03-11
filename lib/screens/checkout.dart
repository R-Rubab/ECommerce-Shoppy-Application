import 'package:ecommerce_shoppers/auth/application_state.dart';
import 'package:ecommerce_shoppers/auth/common.dart';
import 'package:ecommerce_shoppers/auth/firestore.dart';
import 'package:ecommerce_shoppers/models/cart.dart';
import 'package:ecommerce_shoppers/models/product.dart';
import 'package:ecommerce_shoppers/screens/card_detail.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:ecommerce_shoppers/widgets/custom_card.dart';
import 'package:ecommerce_shoppers/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  Future<List<Cart>>? carts;
  Future<List<Product>>? products;

  bool _checkoutButtonLoading = false;
  @override
  void initState() {
    super.initState();
    carts = FirestoreUtil.getCart(
        Provider.of<ApplicationState>(context, listen: false).user);
    products = FirestoreUtil.getProducts([]);
  }

  @override
  Widget build(BuildContext context) {
    //  bool loading = false;
    // List cart = ['2', '2', '3', '4', '5'];

    void checkout() async {
      setState(() {
        _checkoutButtonLoading = true;
      });
      String error = await CommonUtil.checkoutFlow(
          Provider.of<ApplicationState>(context, listen: false).user!);

      if (error.isEmpty) {
        CommonUtil.showAlert(context, "Success", "Your order is placed");
      } else {
        CommonUtil.showAlert(context, "Alert", error);
      }

      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _checkoutButtonLoading = false;
        carts = FirestoreUtil.getCart(
            Provider.of<ApplicationState>(context, listen: false).user);
      });
    }

    onCardPress(Product product) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailCardScreen(
                    product: product,
                  )));
    }

    return FutureBuilder<List<Cart>>(
      future: carts,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          // return
          //  FutureBuilder<List<Product>>(
          //   future: products,
          // builder: (context,AsyncSnapshot<List<Product>> snapshot1) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 450,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        cart: snapshot.data![index],
                        onTab: () {
                          onCardPress(snapshot.data![index]);
                        },
                      );
                    },
                  ),
                ),
                // CartItemWidget(onPressed: () {}),
                // CartItemWidget(onPressed: () {}),
                // CartItemWidget(onPressed: () {}),
                // const SizedBox(height: 20),
                const Divider(
                  height: 2,
                  thickness: 2,
                  color: CustomTheme.grey,
                ),
                // const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        FirestoreUtil.getCartTotal(snapshot.data!).toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onTap: checkout,
                  title: 'CHECKOUT',
                  loading: _checkoutButtonLoading,
                )
              ],
            ),
          );

          // },
          // );
        } else if (snapshot.data != null && snapshot.data!.isEmpty) {
          return const Center(
            child: Icon(
              Icons.add_shopping_cart_sharp,
              color: CustomTheme.yellow,
              size: 150,
            ),
          );
        }
        return const Center(child: Loader());
      },
    );
  }
}
