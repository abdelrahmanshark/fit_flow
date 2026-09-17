import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/data/models/plan_id_resolver.dart';

class OnboardingInput {
  const OnboardingInput({
    this.goalId = OnboardingGoalId.getStrong,
    this.availabilityDays = 3,
  });

  final OnboardingGoalId goalId;
  final int availabilityDays;

  String get planId => PlanIdResolver.resolve(
        goalId: goalId,
        availabilityDays: availabilityDays,
      );

  int get selectedDaysIndex => switch (availabilityDays) {
        2 => 0,
        3 => 1,
        4 => 2,
        5 => 3,
        _ => 1,
      };

  static int availabilityDaysForIndex(int index) {
    return switch (index) {
      0 => 2,
      1 => 3,
      2 => 4,
      3 => 5,
      _ => 3,
    };
  }

  OnboardingInput copyWith({
    OnboardingGoalId? goalId,
    int? availabilityDays,
  }) {
    return OnboardingInput(
      goalId: goalId ?? this.goalId,
      availabilityDays: availabilityDays ?? this.availabilityDays,
    );
  }
}
