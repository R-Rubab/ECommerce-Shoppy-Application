import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final double width;
  final bool loading;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.width = 350,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: 60,
          decoration: BoxDecoration(
              color: CustomTheme.yellow,
              boxShadow: CustomTheme.buttonShadow,
              borderRadius: BorderRadius.circular(35)),
          child: Center(
            child: loading == true
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
          ),
        ),
      ),
    );
  }
}
