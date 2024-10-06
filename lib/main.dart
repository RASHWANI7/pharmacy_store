import 'package:flutter/material.dart';
import 'package:pharmacy_store/model/Auth_Provider.dart';
import 'package:pharmacy_store/model/is_Login.dart';
import 'package:pharmacy_store/model/shop.dart';
import 'package:pharmacy_store/view/pages/cart_page.dart';
import 'package:pharmacy_store/view/pages/home_page.dart';
import 'package:pharmacy_store/view/pages/log_in.dart';
import 'package:pharmacy_store/view/pages/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => Shop()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IsLogin(),
        routes: {
          'log_in': (context) => const Log_In(),
          'sign_up': (context) => const Sign_Up(),
          'home_page': (context) => const Home_Page(),
          'cart_page': (context) => const CartPage(),
        },
      ),
    );
  }
}
