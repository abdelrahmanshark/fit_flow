import 'dart:ui';

import 'package:fit_flow/generated/l10n.dart';
import 'package:fit_flow/utils/app_assets.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBottomActionBar extends StatelessWidget {
  const OnboardingBottomActionBar({
    super.key,
    required this.onContinue,
    this.isLoading = false,
  });

  final VoidCallback onContinue;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 25, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withValues(alpha: 0.8),
            border: const Border(
              top: BorderSide(color: AppColors.iosGrayColor),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isLoading ? null : onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlueColor,
                    foregroundColor: AppColors.whiteColor,
                    disabledBackgroundColor: AppColors.primaryBlueColor,
                    disabledForegroundColor: AppColors.whiteColor,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColors.whiteColor,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              s.onboardingContinue,
                              style: AppStyles.whiteSemiBold17,
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgPicture.asset(
                                AppAssets.onboardingIconArrow,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                s.onboardingChangeLater,
                style: AppStyles.mutedGraySemiBold10,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
