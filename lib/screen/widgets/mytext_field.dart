import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
    final String hintText;
    final bool obscureText;
    final TextEditingController controler;
    MytextField({required this.hintText, required this.obscureText, required this.controler});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.white,

      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.white
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          )
      ),
    );
  }
}
