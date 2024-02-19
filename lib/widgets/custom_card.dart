import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shoppers/models/cart.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cart;

  const CartItemWidget({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        height: 130,
        decoration: CustomTheme.getGridDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: double.infinity,
                    // width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: cart.image,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.headlineMedium,
                            children: [
                          TextSpan(
                            text: 'title: ${cart.title}\n',
                          ),
                          TextSpan(
                            text: 'Qty: ${cart.count}\n',
                          ),
                          TextSpan(
                            text: 'price: ${cart.price}',
                          )
                        ])),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
