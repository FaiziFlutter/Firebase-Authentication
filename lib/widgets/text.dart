import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {
  const TextLine(
      {super.key, required this.text, this.size, this.color, this.weight});
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size. height;
    return Text(
      text,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? width * 0.04,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
