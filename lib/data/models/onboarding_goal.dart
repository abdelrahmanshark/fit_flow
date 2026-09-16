import 'package:fit_flow/generated/l10n.dart';
import 'package:fit_flow/utils/app_assets.dart';

enum OnboardingGoalId { buildMuscle, getStrong, generalFitness }

class OnboardingGoal {
  const OnboardingGoal({
    required this.id,
    required this.iconPath,
    required this.iconWidth,
    required this.iconHeight,
  });

  final OnboardingGoalId id;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  String title(S s) {
    return switch (id) {
      OnboardingGoalId.buildMuscle => s.onboardingGoalBuildMuscleTitle,
      OnboardingGoalId.getStrong => s.onboardingGoalGetStrongTitle,
      OnboardingGoalId.generalFitness => s.onboardingGoalGeneralFitnessTitle,
    };
  }

  String subtitle(S s) {
    return switch (id) {
      OnboardingGoalId.buildMuscle => s.onboardingGoalBuildMuscleSubtitle,
      OnboardingGoalId.getStrong => s.onboardingGoalGetStrongSubtitle,
      OnboardingGoalId.generalFitness => s.onboardingGoalGeneralFitnessSubtitle,
    };
  }

  static const List<OnboardingGoal> goals = [
    OnboardingGoal(
      id: OnboardingGoalId.buildMuscle,
      iconPath: AppAssets.onboardingIconMuscle,
      iconWidth: 19.8,
      iconHeight: 19.8,
    ),
    OnboardingGoal(
      id: OnboardingGoalId.getStrong,
      iconPath: AppAssets.onboardingIconStrong,
      iconWidth: 16.0,
      iconHeight: 18.0,
    ),
    OnboardingGoal(
      id: OnboardingGoalId.generalFitness,
      iconPath: AppAssets.onboardingIconFitness,
      iconWidth: 16.0,
      iconHeight: 21.5,
    ),
  ];

  static List<String> availabilityDays(S s) => [
        s.onboardingDays2,
        s.onboardingDays3,
        s.onboardingDays4,
        s.onboardingDays5Plus,
      ];
}
