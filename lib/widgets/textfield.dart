
import 'package:ecommerce_shoppers/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function() onPressed;
  final IconData icon;
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller,
    required this.onPressed,
    required this.icon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  const BorderSide(color: CustomTheme.yellow, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide:
                  const BorderSide(color: CustomTheme.yellow, width: 2)),
        ),
        validator: validator);
  }
}
