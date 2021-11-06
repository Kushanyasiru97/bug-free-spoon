import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  Widget button({required String name,required Color color,required Color textColor}){
    return Container(
            height: 45.0,
            width: 250.0,
            child: RaisedButton(
            color: color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.green,width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
            ),
            onPressed: () {  },
            child: Text(name,
            style: TextStyle(color: Colors.white,fontSize: 20.0),
            ),
            ),
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset('images/logo.png',),
                ),
              )
          ),
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Welcome My Foood Shop',
                      style: TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.green),
                    ),
                    Column(
                      children: [
                        Text('Order foods from Our Resturant  and'),
                        Text('Make reservation in Real-time'),
                      ],
                    ),
                    button(
                        name: 'LOGIN',
                        color: Colors.green,
                        textColor: Colors.green,
                    ),
                    button(
                        name: 'SIGN UP',
                        color: Colors.transparent,
                        textColor: Colors.green,
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
