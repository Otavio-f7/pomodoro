import 'package:flutter/material.dart';
import 'package:pomodoro/components/CronometroBotao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white
            ),
          ),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Cronometrobotao(
                text: 'Iniciar', 
                icone: Icons.play_arrow
              ),
              // Cronometrobotao(
              //   text: 'Parar', 
              //   icone: Icons.stop_circle
              // ),
              Cronometrobotao(
                text: 'Reiniciar', 
                icone: Icons.restart_alt
              )
            ],
          )
        ],
      ),
    );
  }
}