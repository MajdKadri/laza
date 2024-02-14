import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
   BrandName({super.key,required this.image,required this.text});
  String image ;
  String text ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 115,
        height: 60,
        child: Row(children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: Image.asset(image),
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              color: Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF1D1E20),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0.07,
            ),
          ) ],),
        decoration: ShapeDecoration(
          color: Color(0xffF5F6FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),
        ),
      ),
    );
  }
}
