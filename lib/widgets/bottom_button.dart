import 'package:flutter/material.dart';
import 'package:laza/pages/products_view.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(),
              ));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff9775FA),
            shape: const RoundedRectangleBorder()),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFEFEFE),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            height: 0.06,
          ),
        ),
      ),
    );
  }
}
