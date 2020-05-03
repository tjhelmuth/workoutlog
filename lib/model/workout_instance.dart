import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/model/workout_spec.dart';
import 'package:workout_app/util/util.dart';

class WorkoutInstance {
  //date that the workout took place
  final String _id;
  final DateTime _date;
  final WorkoutSpec _spec;
  final WorkoutResult _result;

  WorkoutInstance(this._date, this._spec, this._result, {String id}) : _id = id ?? getUuid();

  WorkoutInstance withSpec(WorkoutSpec spec){
    return WorkoutInstance(this._date, spec, this._result, id: this._id);
  }

  Map<String, dynamic> toJson(){
    return {
      "id": _id,
      "date": _date.toIso8601String(),
      "spec": _spec.id,
      "result": _result.toJson()
    };
  }

  String get id => _id;
  DateTime get date => _date;
  WorkoutSpec get spec => _spec;
  WorkoutResult get result => _result;
}