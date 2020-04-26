

import 'dart:collection';

import 'package:workout_app/model/exercise_result.dart';

class WorkoutResult {
  final List<ExerciseResult> _exercises;

  UnmodifiableListView<ExerciseResult> get exercises => UnmodifiableListView(_exercises);

  WorkoutResult(this._exercises);

  Map<String, dynamic> toJson(){
    return {
      "exercises": _exercises.map((i) => i.toJson()).toList()
    };
  }
}
