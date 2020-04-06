import 'package:flutter/material.dart';
import 'package:workout_app/layout/log/set_chip.dart';
import 'package:workout_app/model/exercise_spec.dart';



class ExerciseView extends StatelessWidget {
  final ExerciseSpec _spec;

  ExerciseView(this._spec);

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: EdgeInsets.all(8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // name
          Text(_spec.name, style: Theme.of(context).textTheme.subhead),

          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Wrap(
                  runSpacing: 0,
                  spacing: 4,
                  children: this._getSpecChips()
                )
            )
          )
        ]
      )
    );
  }

  List<Widget> _getSpecChips(){
    var setSpecs = this._spec.sets;
    return setSpecs.map((spec) => SetChip(7, 8, false, targetReps: spec.targetReps)).toList();
  }

}