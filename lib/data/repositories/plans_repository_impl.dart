import 'package:fit_flow/data/models/plan.dart';
import 'package:fit_flow/data/services/plans_service.dart';
import 'package:fit_flow/domain/repositories/plans_repository.dart';

class PlansRepositoryImpl implements PlansRepository {
  PlansRepositoryImpl(this._service);

  final PlansService _service;

  @override
  Future<List<Plan>> getPlans() {
    return _service.fetchPlans();
  }
}
