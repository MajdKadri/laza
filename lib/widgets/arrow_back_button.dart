import 'package:flutter/material.dart';
import 'package:laza/fourth_page.dart';

class ArrowBackButton extends StatelessWidget {
   ArrowBackButton({super.key,required this.iconwidget});
Widget iconwidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45),
      child: OutlinedButton(
          onPressed: () {Navigator.pop(context);
            },
          child: iconwidget,
          style: OutlinedButton.styleFrom(backgroundColor: Color(0xffF5F6FA),shape: CircleBorder())),
    );
  }
}
