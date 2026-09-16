import 'package:fit_flow/data/models/onboarding_state.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingLanguageDropdown extends StatelessWidget {
  const OnboardingLanguageDropdown({
    super.key,
    required this.label,
    required this.onSelected,
  });

  final String label;
  final ValueChanged<OnboardingLanguage> onSelected;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return PopupMenuButton<OnboardingLanguage>(
      tooltip: s.languageTooltip,
      offset: const Offset(0, 40),
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.iosGrayColor),
      ),
      onSelected: onSelected,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: OnboardingLanguage.english,
          child: Text(s.languageEnglish, style: AppStyles.slateGrayMedium11),
        ),
        PopupMenuItem(
          value: OnboardingLanguage.arabic,
          child: Text(s.languageArabic, style: AppStyles.slateGrayMedium11),
        ),
      ],
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: AppStyles.primaryBlueSemiBold10),
              const Icon(
                Icons.arrow_drop_down,
                size: 18,
                color: AppColors.primaryBlueColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
