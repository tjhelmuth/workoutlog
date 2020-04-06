import 'dart:collection';

import 'package:workout_app/model/set_spec.dart';

///A specification of an Exercise that has a target amount of sets
class ExerciseSpec {
  final String _name;
  final List<SetSpec> _sets;

  String get name => _name;
  UnmodifiableListView<SetSpec> get sets => UnmodifiableListView<SetSpec>(_sets);

  ExerciseSpec(this._name, this._sets);
}