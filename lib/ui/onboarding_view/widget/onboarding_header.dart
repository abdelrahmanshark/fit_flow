import 'package:fit_flow/data/models/onboarding_state.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_language_dropdown.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    super.key,
    required this.languageLabel,
    required this.onLanguageSelected,
  });

  final String languageLabel;
  final ValueChanged<OnboardingLanguage> onLanguageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColors.softWhiteColor,
        border: Border(
          bottom: BorderSide(color: AppColors.iosGrayColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).appName, style: AppStyles.primaryBlueBold20),
          OnboardingLanguageDropdown(
            label: languageLabel,
            onSelected: onLanguageSelected,
          ),
        ],
      ),
    );
  }
}
