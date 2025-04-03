import 'package:mobx/mobx.dart';


part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store{

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDesncaso = 1;

  @action
  void incrementarTempoTrabalho(){
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho(){
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso(){
    tempoDesncaso++;
  }

  @action
  void decrementarTempoDescanso(){
    tempoDesncaso--;
  }
}