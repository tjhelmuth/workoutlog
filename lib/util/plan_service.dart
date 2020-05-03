import 'package:workout_app/model/workout_spec.dart';

import 'initializer.dart';
import 'persistence.dart';

/**
 * Load cached workout plans from disk
 */
class PlanService {
  Map<String, WorkoutSpec> _cache;

  Future<void> loadCache() async {
    Persistence persistence = getIt<Persistence>();
    List<WorkoutSpec> plans = await persistence.loadPlans();
    Map<String, WorkoutSpec> cache = {};

    for(var plan in plans){
      cache[plan.id] = plan;
    }

    this._cache = cache;
  }

  WorkoutSpec getPlan(String id){
    return _cache[id];
  }

}