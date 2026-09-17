import 'package:fit_flow/data/models/plan.dart';

abstract class PlansRepository {
  Future<List<Plan>> getPlans();
}
