import 'package:flutter/material.dart';

class Entradatempo extends StatelessWidget {
  final int valor;
  final String titulo;
  final void Function()? inc;
  final void Function()? dec;
  const Entradatempo({
    super.key, 
    required this.titulo,
    required this.valor, 
    this.inc, 
    this.dec, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: dec, 
              child: Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(15),
                shape: CircleBorder()
              ),
            ),
            Text(
              '$valor min',
              style: TextStyle(fontSize: 18),
              ),
            ElevatedButton(
              onPressed: inc, 
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(15),
                shape: CircleBorder()
              ),
            ),
          ],
        ),
      ],
    );
  }
}