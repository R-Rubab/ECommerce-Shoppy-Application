import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final void Function() onPressed;
  const CartItemWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://media.cnn.com/api/v1/images/stellar/prod/comfy-shoes-nike-new-lead.jpg?c=16x9&q=h_833,w_1480,c_fill',
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.headlineMedium,
                            children: const [
                          TextSpan(
                            text: 'title: shoes\n',
                          ),
                          TextSpan(
                            text: 'Qty:1\n',
                          ),
                          TextSpan(
                            text: 'price: £200',
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
