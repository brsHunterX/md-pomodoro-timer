import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

enum IntervalType {
  PRIMARY,
  SECONDARY
}

abstract class _PomodoroStore with Store {
  @observable
  bool running = false;
  
  @observable
  int minutes = 30;
  
  @observable
  int seconds = 0;
  
  @observable
  int primaryTime = 30;
  
  @observable
  int secondaryTime = 15;
  
  @observable
  IntervalType intervalType = IntervalType.PRIMARY;

  Timer? stopwatch;

  void _changeIntervalType() {
    if (isPrimary()) {
      intervalType = IntervalType.SECONDARY;
      minutes = secondaryTime;
    } else {
      intervalType = IntervalType.PRIMARY;
      minutes = primaryTime;
    }

    seconds = 0;
  }

  bool isPrimary() {
    return intervalType == IntervalType.PRIMARY;
  }
  
  bool isSecondary() {
    return intervalType == IntervalType.SECONDARY;
  }

  @action
  void incrementPrimaryTime() {
    primaryTime++;

    if (isPrimary()) {
      refresh();
    }
  }
  
  @action
  void decrementPrimaryTime() {
    if (primaryTime > 1) {
      primaryTime--;
    }

    if (isPrimary()) {
      refresh();
    }
  }
  
  @action
  void incrementSecondaryTime() {
    secondaryTime++;

    if (isSecondary()) {
      refresh();
    }
  }
  
  @action
  void decrementSecondaryTime() {
    if (secondaryTime > 1) {
      secondaryTime--;
    }

    if (isSecondary()) {
      refresh();
    }
  }

  @action
  void start() {
    running = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0)  {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }
  
  @action
  void stop() {
    running = false;
    stopwatch?.cancel();
  }
  
  @action
  void refresh() {
    stop();

    minutes = isPrimary() ? primaryTime : secondaryTime;
    seconds = 0;
  }
}

class PomodoroStore = _PomodoroStore with _$PomodoroStore;