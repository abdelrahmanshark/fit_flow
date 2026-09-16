import 'dart:ui';

import 'package:fit_flow/utils/app_assets.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBottomActionBar extends StatelessWidget {
  const OnboardingBottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlueColor,
                    foregroundColor: AppColors.whiteColor,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Continue', style: AppStyles.whiteSemiBold17),
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
                'YOU CAN CHANGE THIS LATER IN PROFILE',
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
