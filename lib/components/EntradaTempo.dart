import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

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
    final store = Provider.of<PomodoroStore>(context);
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
                backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
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
                backgroundColor: store.estaTrabalhando() ? Colors.red : Colors.green,
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