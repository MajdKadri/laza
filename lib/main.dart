import 'package:flutter/material.dart';
import 'package:laza/Model/result_model.dart';
import 'package:laza/fourth_page.dart';
import 'package:laza/product_details.dart';
import 'package:laza/second_page.dart';
import 'package:laza/third_page.dart';
import 'Model/products.dart';
import 'first_page.dart';
import 'services/product_service.dart';

void  main()  {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {

   MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
        home: FirstPage());
  }
}
