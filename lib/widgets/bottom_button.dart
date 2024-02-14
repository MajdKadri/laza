import 'package:flutter/material.dart';
import 'package:laza/fourth_page.dart';

class BottomButton extends StatelessWidget {
   BottomButton({super.key,required this.text, });
  String text;

        @override
        Widget build(BuildContext context) {
      return  SizedBox(width: double.infinity,height: 80,
        child: ElevatedButton(
          onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => FourthPage(),));},
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff9775FA),shape: RoundedRectangleBorder()),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFEFEFE),
            fontSize: 17,
            fontWeight: FontWeight.w500,
            height: 0.06,
          ),
        ) ,
      ),
    );
  }
}
