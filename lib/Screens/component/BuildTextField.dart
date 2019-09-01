import 'package:flutter/material.dart';
class BuildTextField extends StatefulWidget {
  final bool secure;
  final String hintText;
  final String icon;
  final TextEditingController controller;
  BuildTextField({this.controller,this.icon,this.secure,this.hintText});
  @override
  _BuildTextFieldState createState() => _BuildTextFieldState(this.controller,this.icon,this.secure,this.hintText);
}

class _BuildTextFieldState extends State<BuildTextField> {

  final bool secure;
  final String hintText;
  final String icon;
  final TextEditingController controller;
  _BuildTextFieldState(this.controller,this.icon,this.secure,this.hintText);
  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.only(top: 20,right: 25,left: 15),
      child: TextFormField(
        controller: controller,
        obscureText: secure,

        decoration: InputDecoration(
            hintText: hintText,

            border:UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,)),

            //OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none,color: Colors.white)),
            hintStyle: TextStyle(fontSize: 16),
            prefixIcon: Image(image: AssetImage(icon))),
      ),
    );
  }
}
