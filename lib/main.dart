import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/signup_page.dart';
import 'package:food_app/welcome_page.dart';
import 'login_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey,
        )
      ),
      home: homePage()/*StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (index, sncpshot){
          if(sncpshot.hasData){
            return homePage();
          }
          return LoginPage();
        },
      ),*/
    );
  }
}