import 'package:fit_flow/generated/l10n.dart';
import 'package:fit_flow/utils/app_assets.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingRecommendedCard extends StatelessWidget {
  const OnboardingRecommendedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.iosGrayColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              AppAssets.onboardingImage,
              fit: BoxFit.cover,
              alignment: const Alignment(0, -0.35),
            ),
          ),
          ColorFiltered(
            colorFilter: const ColorFilter.matrix(<double>[
              0, 0, 0, 0, 255,
              0, 0, 0, 0, 255,
              0, 0, 0, 0, 255,
              0.2126, 0.7152, 0.0722, 0, 0,
            ]),
            child: Image.asset(
              AppAssets.onboardingImageGradient,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  s.onboardingRecommended,
                  style: AppStyles.primaryBlueSemiBold10,
                ),
                Text(
                  s.onboardingOptimalRecovery,
                  style: AppStyles.slateGrayMedium11,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
