enum OnboardingLanguage { english, arabic }

class OnboardingState {
  const OnboardingState({
    this.selectedLanguage = OnboardingLanguage.arabic,
  });

  final OnboardingLanguage selectedLanguage;

  OnboardingState copyWith({
    OnboardingLanguage? selectedLanguage,
  }) {
    return OnboardingState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
