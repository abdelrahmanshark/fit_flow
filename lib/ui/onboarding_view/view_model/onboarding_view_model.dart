import 'package:fit_flow/cubit/get_onboarding_goals_cubit.dart';
import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/data/models/onboarding_state.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel {
  OnboardingState _state = const OnboardingState();
  List<OnboardingGoal> _goals = const [];
  bool _isGoalsLoading = false;
  String? _goalsError;

  OnboardingState get state => _state;

  List<OnboardingGoal> get goals => _goals;

  bool get isGoalsLoading => _isGoalsLoading;

  String? get goalsError => _goalsError;

  List<String> availabilityDays(S s) => OnboardingGoal.availabilityDays(s);

  String languageLabel(S s) {
    return switch (_state.selectedLanguage) {
      OnboardingLanguage.english => s.languageLabelEn,
      OnboardingLanguage.arabic => s.languageLabelAr,
    };
  }

  Locale localeFor(OnboardingLanguage language) {
    return switch (language) {
      OnboardingLanguage.english => const Locale('en'),
      OnboardingLanguage.arabic => const Locale('ar'),
    };
  }

  String goalTitle(OnboardingGoal goal, Locale locale) {
    return goal.titleForLocale(locale.languageCode);
  }

  void handleGetOnboardingGoalsState(GetOnboardingGoalsState cubitState) {
    if (cubitState is GetOnboardingGoalsLoading) {
      _isGoalsLoading = true;
      _goalsError = null;
      return;
    }

    if (cubitState is GetOnboardingGoalsSuccess) {
      _isGoalsLoading = false;
      _goalsError = null;
      _goals = cubitState.goals;
      return;
    }

    if (cubitState is GetOnboardingGoalsFailure) {
      _isGoalsLoading = false;
      _goalsError = cubitState.message;
    }
  }

  void selectGoal(int index) {
    _state = _state.copyWith(selectedGoalIndex: index);
  }

  void selectDays(int index) {
    _state = _state.copyWith(selectedDaysIndex: index);
  }

  void selectLanguage(OnboardingLanguage language) {
    _state = _state.copyWith(selectedLanguage: language);
  }

  void syncLanguageFromLocale(Locale locale) {
    final language = locale.languageCode == 'ar'
        ? OnboardingLanguage.arabic
        : OnboardingLanguage.english;
    _state = _state.copyWith(selectedLanguage: language);
  }
}
