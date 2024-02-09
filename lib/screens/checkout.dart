import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:ecommerce_shoppers/widgets/custom_button.dart';
import 'package:ecommerce_shoppers/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
     bool loading = false;
    List cart = ['2', '2', '3', '4', '5'];
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
              itemCount: cart.length,
              scrollDirection: Axis.vertical,
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 30),
              itemBuilder: (context, index) {
                return CartItemWidget(onPressed: () {});
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
                  '£20003',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          CustomButton(onTap: () {}, title: 'CheckOut',loading: loading,)
        ],
      ),
    );
  }
}
