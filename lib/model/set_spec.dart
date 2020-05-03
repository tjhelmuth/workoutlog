import 'package:uuid/uuid.dart';
import 'package:workout_app/util/util.dart';

class SetSpec {
  final String _id;
  final int _targetReps;

  int get targetReps => _targetReps;

  String get id => _id;

  SetSpec(this._targetReps, {String id}) : _id = id ?? getUuid();

  static SetSpec fromJson(Map<String, dynamic> fields){
    return SetSpec(
      fields["reps"],
      id: fields["id"]
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "reps": _targetReps,
      "id": _id
    };
  }
}