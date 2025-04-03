import 'package:flutter/material.dart';

class Cronometrobotao extends StatelessWidget {
  final String text;
  final IconData icone;
  final void Function()? click;
  const Cronometrobotao({super.key, required this.text, required this.icone, this.click});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: click, 
      icon: Icon(icone),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.black,
        iconColor: Colors.white,
        iconSize: 30,
        padding: EdgeInsets.all(15)
      ),
    );
  }
}