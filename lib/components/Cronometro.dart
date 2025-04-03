import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/CronometroBotao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
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
            '${store.minutos.toString().padLeft(2,'0')}:${store.segunddos.toString().padLeft(2,'0')}',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white
            ),
          ),
          Observer(
            builder: (_)=> Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                !store.iniciado
                ? Cronometrobotao(
                  text: 'Iniciar', 
                  icone: Icons.play_arrow,
                  click: store.inciar,
                )
                : Cronometrobotao(
                  text: 'Parar', 
                  icone: Icons.stop_circle,
                  click: store.parar,
                ),
                Cronometrobotao(
                  text: 'Reiniciar', 
                  icone: Icons.restart_alt,
                  click: store.reiniciar,
                )
              ],
            )
          )
        ],
      ),
    );
  }
}