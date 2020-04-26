import 'package:test/test.dart';
import 'package:workout_app/model/exercise_result.dart';
import 'package:workout_app/model/json_factory.dart';
import 'package:workout_app/model/set_result.dart';
import 'package:workout_app/model/workout_result.dart';

main(){
  test('Deserializes WorkoutResult', () {
    var jsonStr = """
    {
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
    """;

    WorkoutResult result = JsonFactory.workoutResult(jsonStr);
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

    String json = JsonFactory.workoutResultToJson(result);
    print(json);
  });
}

