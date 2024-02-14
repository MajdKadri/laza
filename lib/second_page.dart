import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laza/third_page.dart';
import 'package:laza/widgets/arrow_back_button.dart';
import 'package:laza/widgets/bottom_button.dart';

import 'widgets/social_media_button.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: double.infinity,height: 80,
        child:BottomButton(text: 'Create an Account',)
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
ArrowBackButton(iconwidget: Icon(Icons.arrow_back,color: Colors.black,size: 50,),),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'Let’s Get Started',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.21,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              SocialMediaButton(
                  icon: 'assets/images/Facebook.png',
                  buttoncolor: Color(0xff4267B2),
                  text: 'Facebook'),
              SocialMediaButton(
                  icon: 'assets/images/Twitter.png',
                  buttoncolor: Color(0xff1DA1F2),
                  text: 'Twitter'),
              SocialMediaButton(
                  icon: 'assets/images/Google.png',
                  buttoncolor: Color(0xffEA4335),
                  text: 'Google'),
              SizedBox(
                height: 180,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF8F959E),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.07,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0.07,
                        ),
                      ),
                       TextSpan(recognizer:TapGestureRecognizer()..onTap=(){Navigator.push(
                           context, MaterialPageRoute(builder: (context) => ThirdPage(),));} ,
                        text: 'Signin',
                        style: TextStyle(
                          color: Color(0xFF1D1E20),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
