import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_shoppers/models/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GridViewCard extends StatelessWidget {
  final int index;
  final Product product;
  final void Function() onPressed;
  const GridViewCard(
      {super.key,
      required this.index,
      required this.onPressed,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: index % 2 == 0
            ? const EdgeInsets.only(left: 22)
            : const EdgeInsets.only(right: 22),
        decoration: CustomTheme.getGridDecoration(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 15,
                    right: 15,
                    child: Icon(
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(5, 4),
                          blurRadius: 15,
                        ),
                      ],
                      CupertinoIcons.heart_fill,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ]),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.headlineSmall,
                            children: [
                          TextSpan(
                            text: product.title,
                          ),
                          TextSpan(
                            text: product.price.toString(),
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
