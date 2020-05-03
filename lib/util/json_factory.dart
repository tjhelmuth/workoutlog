import 'dart:convert';

import 'package:workout_app/layout/log/workout_log.dart';
import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/workout_instance.dart';
import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/model/workout_spec.dart';

import '../model/exercise_result.dart';

class JsonFactory {

  static WorkoutInstance workoutInstance(String jsonStr){
    Map<String, dynamic> fields = json.decode(jsonStr);

    //pull workout spec by id

    String specId = fields['spec'];

    print(fields);
    WorkoutSpec spec = null;

    return WorkoutInstance(
      DateTime.parse(fields['date']),
      spec,
      workoutResult(fields['result']),
      id: fields['id']
    );
  }

  static WorkoutResult workoutResult(Map<String, dynamic> fieldMap){
    print(fieldMap);
    List<dynamic> exerciseMaps = fieldMap['exercises'];
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

  static String workoutInstanceToJson(WorkoutInstance result){
    return json.encode(result.toJson());
  }

  static String workoutSpecsToJson(List<WorkoutSpec> specs){
    return json.encode([...specs.map((spec) => spec.toJson())]);
  }

  static String workoutSpecToJson(WorkoutSpec spec){
    return json.encode(spec.toJson());
  }

  static List<WorkoutSpec> workoutSpecs(String jsonStr){
    List<dynamic> specMaps = json.decode(jsonStr);
    return specMaps.map((i) => WorkoutSpec.fromJson(i));
  }
}