import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laza/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>SecondPage(),));
    });
    return Scaffold(backgroundColor: Color(0xff9775FA),
      body: Center(child: Image.asset('assets/images/Logo.png'),),);
  }
}
