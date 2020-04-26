import 'dart:collection';

import 'package:workout_app/model/set_result.dart';

class ExerciseResult {
  final List<SetResult> _sets;

  UnmodifiableListView<SetResult> get sets => UnmodifiableListView(_sets);

  ExerciseResult(this._sets);

  Map<String, dynamic> toJson(){
    return {
      "sets": _sets.map((i) => i.toJson()).toList()
    };
  }
}