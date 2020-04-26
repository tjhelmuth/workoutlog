import 'dart:convert';

import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/workout_result.dart';

import 'exercise_result.dart';

class JsonFactory {
  static WorkoutResult workoutResult (String jsonStr){
    var fields = json.decode(jsonStr);

    List<dynamic> exerciseMaps = fields['exercises'];
    List<ExerciseResult> exercises = exerciseMaps.map((i) => exerciseResult(i)).toList();

    return WorkoutResult(exercises);
  }

  static ExerciseResult exerciseResult(Map<String, dynamic> exercise){
    List<dynamic> setMaps = exercise["sets"];
    List<SetResult> sets = setMaps.map((i) => setResult(i)).toList();

    return ExerciseResult(sets);
  }

  static SetResult setResult(Map<String, dynamic> set){
    int reps = set["reps"];
    int weight = set["weight"];

    return SetResult(reps, weight);
  }

  static String workoutResultToJson(WorkoutResult result){
    return json.encode(result.toJson());
  }
}