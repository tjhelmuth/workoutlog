import 'package:flutter/material.dart';
import 'package:workout_app/layout/log/set_chip.dart';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/model/set_result.dart';



class ExerciseView extends StatelessWidget {
  final ExerciseSpec _spec;

  ExerciseView(this._spec);

  @override
  Widget build(BuildContext context) {
    return Container (
      padding: EdgeInsets.all(8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(_spec.name, style: Theme.of(context).textTheme.title),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Wrap(
                            runSpacing: 4,
                            spacing: 4,
                            children: this._getSpecChips()
                        )
                    )
                )
              ]
          )
        ]
      )

    );
  }

  List<Widget> _getSpecChips(){
    var setSpecs = this._spec.sets;

    SetResult result = SetResult(7, 80);

    return setSpecs.map((spec) => SetChip(spec, result)).toList();
  }

}