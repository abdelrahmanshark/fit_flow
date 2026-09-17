import 'package:fit_flow/data/models/onboarding_goal.dart';

class PlanIdResolver {
  const PlanIdResolver._();

  static String resolve({
    required OnboardingGoalId goalId,
    required int availabilityDays,
  }) {
    return switch ((goalId, availabilityDays)) {
      (OnboardingGoalId.getStrong, 2) => 'plan_strong_2d',
      (OnboardingGoalId.getStrong, 3) => 'plan_strong_3d',
      (OnboardingGoalId.getStrong, 4) => 'plan_strong_4d',
      (OnboardingGoalId.getStrong, 5) => 'plan_strong_5d',
      (OnboardingGoalId.buildMuscle, 2) => 'plan_muscle_2d',
      (OnboardingGoalId.buildMuscle, 3) => 'plan_muscle_3d',
      (OnboardingGoalId.buildMuscle, 4) => 'plan_muscle_4d',
      (OnboardingGoalId.buildMuscle, 5) => 'plan_muscle_5d',
      (OnboardingGoalId.generalFitness, 2) => 'plan_fitness_2d',
      (OnboardingGoalId.generalFitness, 3) => 'plan_fitness_3d',
      (OnboardingGoalId.generalFitness, 4) => 'plan_fitness_4d',
      (OnboardingGoalId.generalFitness, 5) => 'plan_fitness_5d',
      _ => throw ArgumentError(
          'No plan for goalId=$goalId, availabilityDays=$availabilityDays',
        ),
    };
  }
}
