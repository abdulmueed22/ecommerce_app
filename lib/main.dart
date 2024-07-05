import 'package:ecommerce_app/pages/bottomnav.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/onboarding.dart';
import 'package:ecommerce_app/pages/product_detail.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
