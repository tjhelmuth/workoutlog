import 'dart:collection';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/util/util.dart';

class WorkoutSpec {
  final String _id;
  final List<ExerciseSpec> _exercises;

  UnmodifiableListView<ExerciseSpec> get exercises => UnmodifiableListView(_exercises);
  String get id => _id;

  WorkoutSpec(this._exercises, {String id}) : _id = id ?? getUuid();

  static WorkoutSpec fromJson(Map<String, dynamic> fields){
    return WorkoutSpec(
      fields["exercises"],
      id: fields["id"]
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": _id,
      "exercises": _exercises
    };
  }
}

