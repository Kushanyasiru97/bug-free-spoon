import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/signup_page.dart';
import 'package:food_app/welcome_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            color: Colors.blueGrey,
          )
        ),
        home: homePage(),
        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (index, sncpshot) {
        //       if (sncpshot.hasData) {
        //         return HomePage();
        //       }
        //       return LoginPage();
        //     }),
      ),
    );
  }
}