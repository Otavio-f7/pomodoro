import 'dart:async';

import 'package:mobx/mobx.dart';


part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { trabalho, descanso}

abstract class _PomodoroStore with Store{

  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;
  
  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDesncaso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.trabalho;

  Timer? cronometro;

  @action
  void inciar(){
    iniciado = true;
    cronometro = Timer.periodic(Duration(milliseconds: 50), (timer){
      if(minutos == 0 && segundos == 0){
        _trocarTipoIntervalo();
      }else if(segundos == 0){
        segundos = 59;
        minutos--;
      } else{
        segundos--;
      }
    });
  }
  @action
  void parar(){
    iniciado = false;
    cronometro?.cancel();
  }
  @action
  void reiniciar(){
    iniciado = false;
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDesncaso;
    segundos = 0;
  }

  @action
  void incrementarTempoTrabalho(){
    tempoTrabalho++;
    if(estaTrabalhando()){
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho(){
    if(tempoTrabalho > 1){
      tempoTrabalho--;
      if(estaTrabalhando()){
        reiniciar();
      }
    }
  }

  @action
  void incrementarTempoDescanso(){
    tempoDesncaso++;
    if(estaDescansando()){
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso(){
    if(tempoDesncaso > 1){
     tempoDesncaso--;
      if(estaDescansando()){
        reiniciar();
      } 
    }
    
  }

  bool estaTrabalhando(){
    return tipoIntervalo == TipoIntervalo.trabalho;
  }
  bool estaDescansando(){
    return tipoIntervalo == TipoIntervalo.descanso;
  }

  void _trocarTipoIntervalo(){
    if(estaTrabalhando()){
      tipoIntervalo = TipoIntervalo.descanso;
      minutos = tempoDesncaso;
    } else {
      tipoIntervalo = TipoIntervalo.trabalho;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}