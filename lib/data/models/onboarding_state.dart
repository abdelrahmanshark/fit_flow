enum OnboardingLanguage { english, arabic }

class OnboardingState {
  const OnboardingState({
    this.selectedGoalIndex = 0,
    this.selectedDaysIndex = 1,
    this.selectedLanguage = OnboardingLanguage.arabic,
  });

  final int selectedGoalIndex;
  final int selectedDaysIndex;
  final OnboardingLanguage selectedLanguage;

  OnboardingState copyWith({
    int? selectedGoalIndex,
    int? selectedDaysIndex,
    OnboardingLanguage? selectedLanguage,
  }) {
    return OnboardingState(
      selectedGoalIndex: selectedGoalIndex ?? this.selectedGoalIndex,
      selectedDaysIndex: selectedDaysIndex ?? this.selectedDaysIndex,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
