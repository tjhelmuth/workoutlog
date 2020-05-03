import 'dart:collection';

import 'package:workout_app/model/set_spec.dart';
import 'package:workout_app/util/util.dart';

///A specification of an Exercise that has a target amount of sets
class ExerciseSpec {
  final String _id;
  final String _name;
  final List<SetSpec> _sets;

  String get name => _name;
  String get id => _id;
  UnmodifiableListView<SetSpec> get sets => UnmodifiableListView<SetSpec>(_sets);

  ExerciseSpec(this._name, this._sets, {String id}) : _id = id ?? getUuid();

  static ExerciseSpec fromJson(Map<String, dynamic> fields){
    return ExerciseSpec(
      fields["name"],
      fields["sets"],
      id: fields["id"]
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "id": _id,
      "name": _name,
      "sets": _sets,
    };
  }
}