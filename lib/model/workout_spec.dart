import 'dart:collection';
import 'package:workout_app/model/exercise_spec.dart';

class WorkoutSpec {
  final List<ExerciseSpec> _exercises;

  UnmodifiableListView<ExerciseSpec> get exercises => UnmodifiableListView(_exercises);

  WorkoutSpec(this._exercises);

}
