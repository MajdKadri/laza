import 'package:flutter/material.dart';
import 'package:laza/fourth_page.dart';
import 'package:laza/widgets/arrow_back_button.dart';
import 'package:laza/widgets/bottom_button.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool switchbutton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomButton(
        text: 'Login',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBackButton(
              iconwidget: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 0.04,
                    letterSpacing: -0.21,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Please enter your data to continue',
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: TextField(
                decoration: InputDecoration(
                    label: Text(
                      'Username',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    label: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF8F959E),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xFFEA4335),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF1D1E20),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                  Switch(
                    activeColor: Color(0xff34C759),
                    value: switchbutton,
                    onChanged: (value) {
                      setState(() {
                        switchbutton = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(style: TextStyle(fontSize: 15), children: [
                    TextSpan(
                        style: TextStyle(color: Color(0xff0FF8F959E)),
                        text:
                        'By connecting your account confirm that you agree with our '),
                    TextSpan(
                        text: 'Term and Condition',
                        style: TextStyle(color: Color(0xFF1D1E20)))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
