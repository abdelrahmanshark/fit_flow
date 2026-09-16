import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/data/services/onboarding_goals_service.dart';
import 'package:fit_flow/domain/repositories/onboarding_goals_repository.dart';

class OnboardingGoalsRepositoryImpl implements OnboardingGoalsRepository {
  OnboardingGoalsRepositoryImpl(this._service);

  final OnboardingGoalsService _service;

  @override
  Future<List<OnboardingGoal>> getOnboardingGoals() {
    return _service.fetchGoals();
  }
}
