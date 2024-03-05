import 'package:flutter/material.dart';
import 'package:laza/pages/products_view.dart';

class ArrowBackButton extends StatelessWidget {
  ArrowBackButton({super.key, required this.iconwidget});
  Widget iconwidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffF5F6FA),
              shape: const CircleBorder()),
          child: iconwidget),
    );
  }
}
