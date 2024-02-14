import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
   SocialMediaButton({super.key,required this.icon,required this .buttoncolor,required this.text});
String icon;
Color buttoncolor;
String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16 ,right:16 ,bottom: 10),
      child: SizedBox(height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                backgroundColor: buttoncolor),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w600,
                      height: 0.08,
                      letterSpacing: -0.41,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
