import 'package:flutter/material.dart';
import 'package:workout_app/layout/log/top_menu.dart';
import 'package:workout_app/layout/log/exercise_view.dart';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/model/set_spec.dart';

ExerciseSpec spec = ExerciseSpec("Bench", [SetSpec(5), SetSpec(7), SetSpec(7), SetSpec(5), SetSpec(3)]);

class WorkoutLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopMenu(),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              ExerciseView(spec),
            ]
          )
        )
      ]
    );
  }

}