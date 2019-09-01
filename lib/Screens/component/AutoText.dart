import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoText extends StatelessWidget {
  final String text;
  final Color color;
   double size=10;
  final FontWeight fontWeight;


  AutoText({this.text,this.color,this.size,this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight

      ),
      textAlign: TextAlign.center,

      maxLines: 1,
      maxFontSize: 25,
    );
  }
}
