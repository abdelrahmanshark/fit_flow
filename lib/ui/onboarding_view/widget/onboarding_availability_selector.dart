import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingAvailabilitySelector extends StatelessWidget {
  const OnboardingAvailabilitySelector({
    super.key,
    required this.selectedIndex,
    required this.labels,
    required this.onSelected,
  });

  final int selectedIndex;
  final List<String> labels;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.iosGrayColor),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = selectedIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryBlueColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  style: isSelected
                      ? AppStyles.whiteSemiBold13
                      : AppStyles.mutedGraySemiBold13,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
