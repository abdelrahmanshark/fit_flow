import 'package:fit_flow/generated/l10n.dart';
import 'package:fit_flow/utils/app_assets.dart';

enum OnboardingGoalId { buildMuscle, getStrong, generalFitness }

class OnboardingGoal {
  const OnboardingGoal({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.iconPath,
    required this.iconWidth,
    required this.iconHeight,
  });

  final OnboardingGoalId id;
  final String titleEn;
  final String titleAr;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  String titleForLocale(String languageCode) {
    return languageCode == 'ar' ? titleAr : titleEn;
  }

  String subtitle(S s) {
    return switch (id) {
      OnboardingGoalId.buildMuscle => s.onboardingGoalBuildMuscleSubtitle,
      OnboardingGoalId.getStrong => s.onboardingGoalGetStrongSubtitle,
      OnboardingGoalId.generalFitness => s.onboardingGoalGeneralFitnessSubtitle,
    };
  }

  factory OnboardingGoal.fromJson(Map<String, dynamic> json) {
    final id = _parseId(json['id'] as String);
    final title = json['title'] as Map<String, dynamic>;
    final icon = _iconMetaFor(id);

    return OnboardingGoal(
      id: id,
      titleEn: title['en'] as String,
      titleAr: title['ar'] as String,
      iconPath: icon.path,
      iconWidth: icon.width,
      iconHeight: icon.height,
    );
  }

  static OnboardingGoalId _parseId(String raw) {
    return switch (raw) {
      'build_muscle' => OnboardingGoalId.buildMuscle,
      'get_strong' => OnboardingGoalId.getStrong,
      'general_fitness' => OnboardingGoalId.generalFitness,
      _ => throw FormatException('Unknown onboarding goal id: $raw'),
    };
  }

  static ({String path, double width, double height}) _iconMetaFor(
    OnboardingGoalId id,
  ) {
    return switch (id) {
      OnboardingGoalId.buildMuscle => (
          path: AppAssets.onboardingIconMuscle,
          width: 19.8,
          height: 19.8,
        ),
      OnboardingGoalId.getStrong => (
          path: AppAssets.onboardingIconStrong,
          width: 16.0,
          height: 18.0,
        ),
      OnboardingGoalId.generalFitness => (
          path: AppAssets.onboardingIconFitness,
          width: 16.0,
          height: 21.5,
        ),
    };
  }

  static List<String> availabilityDays(S s) => [
        s.onboardingDays2,
        s.onboardingDays3,
        s.onboardingDays4,
        s.onboardingDays5Plus,
      ];
}
