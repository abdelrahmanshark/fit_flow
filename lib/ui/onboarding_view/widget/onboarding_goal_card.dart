import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingGoalCard extends StatelessWidget {
  const OnboardingGoalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.iconWidth,
    required this.iconHeight,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String iconPath;
  final double iconWidth;
  final double iconHeight;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(isSelected ? 18 : 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryBlueColor
                  : AppColors.iosGrayColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.iceGrayColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: SizedBox(
                  width: iconWidth,
                  height: iconHeight,
                  child: SvgPicture.asset(
                    iconPath,
                    width: iconWidth,
                    height: iconHeight,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyles.nearBlackBold16),
                    Text(subtitle, style: AppStyles.grayBlueRegular13),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _RadioIndicator(isSelected: isSelected),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioIndicator extends StatelessWidget {
  const _RadioIndicator({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          color: AppColors.primaryBlueColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lavenderGrayColor),
      ),
    );
  }
}
