import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screen/widgets/mytext_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  late UserCredential userCredential;
  /*RegExp regExp = RegExp(SignUp.pattern);*/
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState> ();

  Future sendData() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
     await FirebaseFirestore.instance.collection('userData').doc(userCredential.user!.uid).set({
        'firstName' : firstName,
        'lastName' : lastName,
        'email' : email,
        'userId': userCredential.user!.uid,
        'password': password,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState!.showSnackBar(
          SnackBar(content: Text("Your Entered Password Too Weak!"),),
        );
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState!.showSnackBar(
            SnackBar(content: Text("Your Entered Email address already Use"),),
        );
      }
    } catch (e) {
      print(e);
    }
  }




  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
              'First Name is Empty!'),
        ),
      );
      return;
    }


    if(lastName.text.trim().isEmpty || lastName.text.trim() == null){
    globalKey.currentState!.showSnackBar(
    SnackBar(
    content: Text(
    'Last Name is Empty!'),
    ),
    );
    return;
    }

    if(email.text.trim().isEmpty || email.text.trim() == null){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
              'Email is Empty!'),
        ),
      );
      return;
    }
    /*else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            "Please enter the vaild Email",
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
    else{
      sendData();
    }
  }

  Widget button({required String buttonName, required Color buttonColor, required Color textColor,required Function ontap}){
    return Container(
      height: 50.0,
      width: 130.0,
      child: RaisedButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor,
            fontSize: 20.0,
          ),
        ),
        onPressed: () {  },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0
                ),
              ),
              Container(
                height: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                MytextField(
                  hintText: 'FirstName',
                  obscureText: false,
                  controler: firstName,
                ),
                    MytextField(
                        hintText: 'LastName',
                      obscureText: false,
                      controler: lastName,
                    ),
                    MytextField(
                        hintText: 'Email',
                      obscureText: false,
                      controler: email,
                    ),
                    MytextField(
                        hintText: 'Password',
                      obscureText: true,
                      controler: password,
                    ),
                    MytextField(
                        hintText: 'Confirm Password',
                      obscureText: true,
                      controler: password,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  button(
                    ontap: (){},
                      buttonName: "Cancel",
                      buttonColor: Colors.white,
                      textColor: Colors.grey
                  ),
                  SizedBox(width:20.0,),

                     button(
                       ontap: (){
                         validation();
                       },
                      buttonName: "Register",
                      buttonColor: Colors.red,
                      textColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

