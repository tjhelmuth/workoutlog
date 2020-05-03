import 'package:get_it/get_it.dart';
import 'package:workout_app/util/plan_service.dart';

import 'persistence.dart';

/**
 * Responsible for loading all of the data that the app will use
 */
GetIt getIt = GetIt.I;

class Initializer {

  Future<void> initialize () async {
    registerServices();
    loadData();
  }

  registerServices(){
    getIt.registerSingleton<Persistence>(Persistence());
    getIt.registerSingleton<PlanService>(PlanService());
  }

  Future<void> loadData() async {
    await getIt<PlanService>().loadCache();
  }
}
