import 'package:fit_flow/utils/app_assets.dart';

class OnboardingGoal {
  const OnboardingGoal({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconWidth,
    required this.iconHeight,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;

  static const List<OnboardingGoal> goals = [
    OnboardingGoal(
      title: 'Build Muscle',
      subtitle: 'Focus on hypertrophy and strength.',
      iconPath: AppAssets.onboardingIconMuscle,
      iconWidth: 19.8,
      iconHeight: 19.8,
    ),
    OnboardingGoal(
      title: 'Get Strong',
      subtitle: 'Prioritize heavy lifting and power.',
      iconPath: AppAssets.onboardingIconStrong,
      iconWidth: 16.0,
      iconHeight: 18.0,
    ),
    OnboardingGoal(
      title: 'General Fitness',
      subtitle: 'Balanced health and mobility.',
      iconPath: AppAssets.onboardingIconFitness,
      iconWidth: 16.0,
      iconHeight: 21.5,
    ),
  ];

  static const List<String> availabilityDays = [
    '2 Days',
    '3 Days',
    '4 Days',
    '5+ Days',
  ];
}
