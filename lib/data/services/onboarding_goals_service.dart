import 'dart:convert';

import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/utils/app_assets.dart';
import 'package:flutter/services.dart';

class OnboardingGoalsService {
  Future<List<OnboardingGoal>> fetchGoals() async {
    final raw = await rootBundle.loadString(AppAssets.goalsJson);
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final goalsJson = decoded['goals'] as List<dynamic>;

    return goalsJson
        .map(
          (item) => OnboardingGoal.fromJson(item as Map<String, dynamic>),
        )
        .toList();
  }
}
