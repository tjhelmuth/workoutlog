
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:workout_app/model/exercise_spec.dart';
import 'package:workout_app/model/set_spec.dart';
import 'package:workout_app/model/workout_spec.dart';
import 'package:workout_app/util/initializer.dart';
import 'package:workout_app/util/persistence.dart';
import 'package:workout_app/util/plan_service.dart';

class MockPersistence extends Mock implements Persistence {}

MockPersistence mockPersistence = MockPersistence();

main(){
  getIt.registerSingleton<Persistence>(mockPersistence);

  PlanService service = PlanService();

  test("Loads cache from disk", () async {
    WorkoutSpec plan = WorkoutSpec([
      ExerciseSpec("Bench", [SetSpec(5, id: 'set')], id: 'bench')
    ], id: 'workout1');

    when(mockPersistence.loadPlans()).thenAnswer((_) async => Future.value([plan]));

    await service.loadCache();

    expect(service.getPlan("workout1"), equals(plan));
  });
}