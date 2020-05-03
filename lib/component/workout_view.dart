//a single workout instance in the workout log


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/layout/log/exercise_view.dart';
import 'package:workout_app/model/workout_instance.dart';
import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/model/workout_spec.dart';

class WorkoutView extends StatelessWidget {
  final WorkoutInstance _workout;

  const WorkoutView(this._workout, {Key key}) : super(key: key);

  WorkoutResult get result => _workout.result;
  WorkoutSpec get spec => _workout.spec;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              //TODO: this should be title not date
              child: Text("Chest Day", style: Theme.of(context).textTheme.headline)
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(_workout.date.toString(), style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.grey[600]))
            ),

            ...mapExercises(),

            Container(
              padding: EdgeInsets.all(8),
              child: Divider()
            )
          ]
      )
    );
  }

  List<Widget> mapExercises(){
    int numExercises = result.exercises.length;
    //TODO: Handle case where there are more exercises in result than in spec :)

    List<Widget> results = [];
    for(int i = 0; i < numExercises; i++){
      var result = this.result.exercises[i];
      var spec = this.spec.exercises[i];

      //TODO: spec might not exist so spec.id won't work for key :D
      results.add(ExerciseView(spec, result, key: ObjectKey(spec.id)));
//      results.add(Container(
//        height: 20,
//        padding: EdgeInsets.all(8),
//        color: Color(0xededed),
//        child: Text("ayy :D")
//      ));

      if(i < numExercises - 1){
//        results.add(Divider(indent: 16, endIndent: 16));
      }
    }

    return results;
  }

}