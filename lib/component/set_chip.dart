import 'package:flutter/material.dart';
import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/set_spec.dart';

class SetChip extends StatelessWidget {
  //can be null - this means its an extra set that isn't part of the workout plan
  final SetSpec _target;

  //can be null - this means we haven't recorded anything for this set yet
  final SetResult _result;

  const SetChip(this._target, this._result, {Key key}) : super(key: key);

  bool get isComplete => _target != null;

  int get targetReps => _target?.targetReps ?? double.infinity;

  int get completedReps => _result?.completedReps ?? 0;

  bool get isBelowTarget => this.completedReps < this.targetReps;

  @override
  Widget build(BuildContext context) {

    return Theme(child: Material(
      color: this.isComplete ? Colors.grey[800] : Colors.transparent,
      elevation: 5,
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          padding: EdgeInsets.all(8),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
//              CircleAvatar(child: Text("1"), radius: 8),
              Text('${this.completedReps}', style: TextStyle(color: this.isBelowTarget ? Colors.red : Colors.green),),
              Padding(padding: EdgeInsets.only(right: 2, left: 2), child: Text("x", style: TextStyle(fontSize: 10, color: Colors.grey[400]))),
              Text('${this._result?.weight ?? 0}', style: TextStyle(color: Colors.grey[400])),
              Text('lb', style: TextStyle(fontSize: 10, color: Colors.grey[400]))
            ]
          )
        ),
      ),
    ), data: ThemeData(splashColor: Colors.grey[800]));
  }
}