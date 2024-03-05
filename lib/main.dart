import 'package:flutter/material.dart';
import 'package:laza/pages/products_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/splashscreen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // await Supabase.initialize(
  //     url: 'https://gpuyjvxbcwmsddfjxgvl.supabase.co',
  //     anonKey:
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwdXlqdnhiY3dtc2RkZmp4Z3ZsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg5ODYwNDcsImV4cCI6MjAyNDU2MjA0N30.4a6vzIQ5oQi1DAqUW9b6d5vy_in2jrvrxjKYF3GGqzU');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false, home: ProductsScreen());
  }
}
