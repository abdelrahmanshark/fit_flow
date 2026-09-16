class OnboardingState {
  const OnboardingState({
    this.selectedGoalIndex = 1,
    this.selectedDaysIndex = 1,
  });

  final int selectedGoalIndex;
  final int selectedDaysIndex;

  OnboardingState copyWith({
    int? selectedGoalIndex,
    int? selectedDaysIndex,
  }) {
    return OnboardingState(
      selectedGoalIndex: selectedGoalIndex ?? this.selectedGoalIndex,
      selectedDaysIndex: selectedDaysIndex ?? this.selectedDaysIndex,
    );
  }
}
