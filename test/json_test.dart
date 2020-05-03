import 'package:test/test.dart';
import 'package:workout_app/model/exercise_result.dart';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/model/set_spec.dart';
import 'package:workout_app/model/workout_instance.dart';
import 'package:workout_app/model/workout_spec.dart';
import 'package:workout_app/util/json_factory.dart';
import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/util/util.dart';



main(){
  test('Deserializes WorkoutInstance', () {
    var jsonStr = """
    {
      "id": "${getUuid()}",
      "date": "${DateTime(2020, 4, 27).toIso8601String()}",
      "spec": "${getUuid()}",
      "result": {
        "exercises": [
          {
            "sets": [
              {
                "reps": 7,
                "weight": 150
              },
              {
                "reps": 4,
                "weight": 100
              }
            ]
          }
        ] 
      }
    }
    """;

    WorkoutInstance instance = JsonFactory.workoutInstance(jsonStr);
    WorkoutResult result = instance.result;
    ExerciseResult exercise = result.exercises[0];
    SetResult set = exercise.sets[0];

    expect(set.weight, equals(150));
    expect(set.completedReps, equals(7));
  });


  test('Serializes WorkoutResult', () {
    WorkoutResult result = WorkoutResult([
      ExerciseResult([
        SetResult(5, 140)
      ])
    ]);

    WorkoutSpec spec = WorkoutSpec([
      ExerciseSpec("Squats", [SetSpec(5, id: "set1")], id: "squats"),
      ExerciseSpec("Bench", [SetSpec(5, id: "set1")], id: "bench"),
    ], id: "workout");

    WorkoutInstance instance = WorkoutInstance(DateTime(2020, 4, 27), spec, result, id: "instance");

    String json = JsonFactory.workoutInstanceToJson(instance);
    print(json);
    expect(json, equals('{"id":"instance","date":"2020-04-27T00:00:00.000","spec":"workout","result":{"exercises":[{"sets":[{"reps":5,"weight":140}]}]}}'));
  });
}

