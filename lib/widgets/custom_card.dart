import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shoppers/models/cart.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cart;
  final VoidCallback onTab;

  const CartItemWidget({super.key, required this.cart,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onTab,
        child: Container(
          margin: const EdgeInsets.only(bottom: 25),
          height: 130,
          decoration: CustomTheme.getGridDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: SizedBox(
                      height: double.infinity,
                      // width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: cart.image,
                        fit: BoxFit.cover,
                      ),
                    )),
                Expanded(
                    flex: 7,
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
                    )),
                Container(
                  margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  width: 60,
                  decoration: const BoxDecoration(
                      color: CustomTheme.amber,
                      borderRadius: BorderRadius.all(Radius.circular(22))),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Icon(
                          CupertinoIcons.minus,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
