import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:workout_app/model/workout_instance.dart';

class CurrentWorkoutProvider extends ChangeNotifier {
  List<WorkoutInstance> _currentWorkouts = [];

  setCurrentWorkouts(List<WorkoutInstance> workouts){
    this._currentWorkouts = workouts;
    notifyListeners();
  }

  List<WorkoutInstance> get currentWorkouts => UnmodifiableListView(_currentWorkouts);
}