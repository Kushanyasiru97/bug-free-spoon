import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/login_page.dart';
import 'package:food_app/signup_page.dart';
/*import 'package:food_app/signup_page.dart';
import 'package:food_app/welcome_page.dart';*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}