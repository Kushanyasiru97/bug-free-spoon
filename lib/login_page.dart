import 'package:flutter/material.dart';
import 'package:food_app/screen/widgets/mytext_field.dart';


class LoginPage extends StatefulWidget {

  static Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*RegExp regExp = RegExp(LoginPage.pattern);*/
TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState> ();

  void validation() {
    if(email.text.trim().isEmpty || email.text.trim() == null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
              'Email is Empty!'),
        ),
      );
      return;
    }
   /* else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Please enter vaild Email",
          ),
        ),
      );
      return;
    }*/


    if(password.text.trim().isEmpty || password.text.trim() == null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
              'Password is Empty!'),
        ),
      );
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Login In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MytextField(
                  controler: email,
                  obscureText: false,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 30,
                ),
                MytextField(
                  controler: password,
                  obscureText: true,
                  hintText: 'Password',
                ),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  validation();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New user?",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Register now.",
                  style: TextStyle(color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}