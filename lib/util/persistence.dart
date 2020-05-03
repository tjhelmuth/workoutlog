import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:workout_app/model/workout_instance.dart';
import 'package:workout_app/model/workout_result.dart';
import 'package:workout_app/model/workout_spec.dart';
import 'package:workout_app/util/json_factory.dart';

class Persistence {
  static const String RESULTS_FILE = "workoutResults.json";
  static const String PLANS_FILE = "workoutPlans.json";

  Future<String> getFilePath(String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName";
  }

  saveWorkoutInstance(WorkoutInstance workout) async {
    String filePath = await getFilePath(RESULTS_FILE);
    final file = File(filePath);

    String contents = JsonFactory.workoutInstanceToJson(workout);

    await file.writeAsString(contents);
  }

  Future<WorkoutInstance> loadResults() async {
    String filePath = await getFilePath(RESULTS_FILE);
    final file = File(filePath);
    final exists = await file.exists();

    if(!exists){
      return null;
    }

    return JsonFactory.workoutInstance(await file.readAsString());
  }

  Future<List<WorkoutSpec>> loadPlans() async {
    String filePath = await getFilePath(PLANS_FILE);
    final file = File(filePath);
    final exists = await file.exists();
    if(!exists){
      return null;
    }

    return JsonFactory.workoutSpecs(await file.readAsString());
  }

  Future saveWorkoutPlans(List<WorkoutSpec> workouts) async {
    String filePath = await getFilePath(PLANS_FILE);
    final file = File(filePath);

    String contents = JsonFactory.workoutSpecsToJson(workouts);

    return file.writeAsString(contents);
  }
}
