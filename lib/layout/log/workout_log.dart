import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/component/workout_view.dart';
import 'package:workout_app/layout/log/top_menu.dart';
import 'package:workout_app/layout/log/exercise_view.dart';
import 'package:workout_app/model/exercise_result.dart';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/set_spec.dart';
import 'package:workout_app/model/workout_instance.dart';
import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/model/workout_spec.dart';
import 'package:workout_app/provider/current_workout_provider.dart';
import 'package:workout_app/util/initializer.dart';
import 'package:workout_app/util/persistence.dart';


WorkoutResult result = WorkoutResult([
  ExerciseResult([
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125)
  ]),

  ExerciseResult([
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125),
    SetResult(5, 125)
  ])
]);

WorkoutSpec spec = WorkoutSpec([
  ExerciseSpec("Squats", [
    SetSpec(5, id: "set1"),
    SetSpec(5, id: "set2"),
    SetSpec(5, id: "set3"),
    SetSpec(5, id: "set4"),
    SetSpec(5, id: "set5"),
  ], id: "squats"),
  ExerciseSpec("Bench", [
    SetSpec(5, id: "set1"),
    SetSpec(5, id: "set2"),
    SetSpec(5, id: "set3"),
    SetSpec(5, id: "set4"),
    SetSpec(5, id: "set5"),
  ], id: "bench"),
], id: "workout");

WorkoutInstance instance = WorkoutInstance(DateTime(2020, 4, 27), spec, result, id: "instance");
class WorkoutState extends State<WorkoutLog> {
  CurrentWorkoutProvider _provider = CurrentWorkoutProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentWorkoutProvider>(
          create: (context) => _provider,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TopMenu(),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Consumer<CurrentWorkoutProvider> (
                    builder: (context, provider, child){
                      return Row(
                        children: <Widget>[
                          OutlineButton(color: Colors.red, child: Text("Load"), onPressed: () async {
                            var persistence = getIt<Persistence>();

                            await persistence.saveWorkoutInstance(instance);
                            WorkoutInstance workout = await persistence.loadResults();

                            workout = workout.withSpec(spec);

                            _provider.setCurrentWorkouts([workout]);
                          }),
                          Spacer(),
                          OutlineButton(color: Colors.red, child: Text("Save"), onPressed: (){}),
                        ],
                      );
                    }
                  )
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Consumer<CurrentWorkoutProvider> (
                                builder: (context, provider, child) {
                                  return Row(
                                      children: mapWorkouts(provider.currentWorkouts)
                                  );
                                },
                              )
                          ),
                        ]
                    )
                )
              ]
          )
      );
  }

  List<Widget> mapWorkouts(List<WorkoutInstance> workouts){
    return workouts.map((workout) => WorkoutView(
        workout, key: ObjectKey(workout.id)
    )).toList();
  }

  @override
  void initState() {
    super.initState();
//    loadWorkouts();
  }

  void loadWorkouts() async {
    var persistence = getIt<Persistence>();

    await persistence.saveWorkoutInstance(instance);
    WorkoutInstance workout = await persistence.loadResults();

    workout = workout.withSpec(spec);

    _provider.setCurrentWorkouts([workout]);
  }

}
class WorkoutLog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WorkoutState();
  }
}