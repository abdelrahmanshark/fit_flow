import 'package:fit_flow/cubit/get_complete_workout_plan_cubit.dart';
import 'package:fit_flow/cubit/get_onboarding_goals_cubit.dart';
import 'package:fit_flow/data/models/complete_workout_plan.dart';
import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/data/models/onboarding_input.dart';
import 'package:fit_flow/data/models/onboarding_state.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel {
  OnboardingState _state = const OnboardingState();
  OnboardingInput _input = const OnboardingInput();
  List<OnboardingGoal> _goals = const [];
  bool _isGoalsLoading = false;
  String? _goalsError;
  bool _isCreatingPlan = false;
  String? _createPlanError;
  CompleteWorkoutPlan? _completeWorkoutPlan;

  OnboardingState get state => _state;

  OnboardingInput get input => _input;

  List<OnboardingGoal> get goals => _goals;

  bool get isGoalsLoading => _isGoalsLoading;

  String? get goalsError => _goalsError;

  bool get isCreatingPlan => _isCreatingPlan;

  String? get createPlanError => _createPlanError;

  CompleteWorkoutPlan? get completeWorkoutPlan => _completeWorkoutPlan;

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
      if (_goals.isNotEmpty) {
        final hasSelectedGoal = _goals.any((goal) => goal.id == _input.goalId);
        if (!hasSelectedGoal) {
          _input = _input.copyWith(goalId: _goals.first.id);
        }
      }
      return;
    }

    if (cubitState is GetOnboardingGoalsFailure) {
      _isGoalsLoading = false;
      _goalsError = cubitState.message;
    }
  }

  void handleGetCompleteWorkoutPlanState(
    GetCompleteWorkoutPlanState cubitState,
  ) {
    if (cubitState is GetCompleteWorkoutPlanLoading) {
      _isCreatingPlan = true;
      _createPlanError = null;
      return;
    }

    if (cubitState is GetCompleteWorkoutPlanSuccess) {
      _isCreatingPlan = false;
      _createPlanError = null;
      _completeWorkoutPlan = cubitState.plan;
      return;
    }

    if (cubitState is GetCompleteWorkoutPlanFailure) {
      _isCreatingPlan = false;
      _createPlanError = cubitState.message;
    }
  }

  void selectGoal(OnboardingGoalId goalId) {
    _input = _input.copyWith(goalId: goalId);
  }

  void selectDays(int availabilityDays) {
    _input = _input.copyWith(availabilityDays: availabilityDays);
  }

  void selectDaysByIndex(int index) {
    selectDays(OnboardingInput.availabilityDaysForIndex(index));
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
