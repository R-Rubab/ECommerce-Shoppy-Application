import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shoppers/auth/application_state.dart';
import 'package:ecommerce_shoppers/auth/firestore.dart';
import 'package:ecommerce_shoppers/models/product.dart';

import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailCardScreen extends StatefulWidget {
  final Product product;
  const DetailCardScreen({super.key, required this.product});

  @override
  State<DetailCardScreen> createState() => _DetailCardScreenState();
}

class _DetailCardScreenState extends State<DetailCardScreen> {

  bool loading = false;

  void onAddToCart() async {
    setState(() {
      loading = true;
    });
    await FirestoreUtil.addToCart(
        Provider.of<ApplicationState>(context, listen: false).user,
        widget.product.id);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
 container(void Function() onTap) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Text(
              'MRP: ${widget.product.price}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CustomButton(loading: loading, onTap: onAddToCart, title: 'Add to card'),
            Text(
              'About the items ',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: CustomTheme.yellow,
                              child: Icon(Icons.share_outlined)),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: CustomTheme.grey,
                              shape: BoxShape.rectangle,
                            ),
                            child: IconButton(
                                onPressed: () {
                                                     Navigator.of(context).pop(true);

                                },
                                icon: const Icon(Icons.arrow_back_sharp)),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  container(() {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
