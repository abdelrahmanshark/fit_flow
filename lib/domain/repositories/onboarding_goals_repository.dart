import 'package:fit_flow/data/models/onboarding_goal.dart';

abstract class OnboardingGoalsRepository {
  Future<List<OnboardingGoal>> getOnboardingGoals();
}
