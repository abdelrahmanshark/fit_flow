import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/data/models/onboarding_state.dart';

class OnboardingViewModel {
  OnboardingState _state = const OnboardingState();

  OnboardingState get state => _state;

  List<OnboardingGoal> get goals => OnboardingGoal.goals;

  List<String> get availabilityDays => OnboardingGoal.availabilityDays;

  void selectGoal(int index) {
    _state = _state.copyWith(selectedGoalIndex: index);
  }

  void selectDays(int index) {
    _state = _state.copyWith(selectedDaysIndex: index);
  }
}
