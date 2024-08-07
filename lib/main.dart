import 'package:ecommerce_app/Admin/admin_login.dart';
import 'package:ecommerce_app/Admin/all_orders.dart';
import 'package:ecommerce_app/Admin/home_admin.dart';
import 'package:ecommerce_app/pages/bottomnav.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/onboarding.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:ecommerce_app/services/constraint.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'Admin/add_product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishablekey;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
      // home: HomeAdmin(),
    );
  }
}

