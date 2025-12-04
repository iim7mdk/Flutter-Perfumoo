import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'screens/products_screen.dart';
import 'screens/product_details.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/add_product_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? userEmail;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    userEmail = prefs.getString("user");
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfume Store',
      theme: ThemeData(primarySwatch: Colors.purple),

      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },

      home: userEmail == null ? LoginScreen() : HomeScreen(),

      routes: {
        "/home": (context) => HomeScreen(),
        "/products": (context) => ProductsScreen(),
        "/details": (context) => ProductDetails(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        "/add": (context) => AddProductScreen(),
      },
    );


  }
}
