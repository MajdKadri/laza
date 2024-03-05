import 'dart:async';
import 'package:laza/pages/account.dart';
import 'package:laza/pages/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:laza/pages/registerpage.dart';
import 'package:laza/pages/third_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = supabase.auth.currentSession;
    if (!mounted) {
      return;
    }
    if (session == null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AccountPage(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ThirdPage(),
    //       ));
    // });
    //
    return Scaffold(
      backgroundColor: const Color(0xff9775FA),
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  }
}
