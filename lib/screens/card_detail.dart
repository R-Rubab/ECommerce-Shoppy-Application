import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DetailCardScreen extends StatelessWidget {
  const DetailCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    Widget container(void Function() onTap) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Title',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Text(
              'MRP: £20003',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CustomButton(loading: loading, onTap: onTap, title: 'Add to card'),
            Text(
              'About the items ',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              '''item descriptionPrint Debug Information: Print out the JSON data before parsing to see if there are any unexpected characters or formatting issues.\n
              Review Code Logic: Review the code around the JSON parsing to ensure that the data source is correct and that the parsing logic matches the structure of the JSON data.''',
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
                          imageUrl:
                              'https://media.cnn.com/api/v1/images/stellar/prod/comfy-shoes-nike-new-lead.jpg?c=16x9&q=h_833,w_1480,c_fill',
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
                              child: const Icon(Icons.arrow_back_sharp)),
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
