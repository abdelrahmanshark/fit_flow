import 'package:fit_flow/ui/onboarding_view/view_model/onboarding_view_model.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_availability_selector.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_bottom_action_bar.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_goal_card.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_header.dart';
import 'package:fit_flow/ui/onboarding_view/widget/onboarding_recommended_card.dart';
import 'package:fit_flow/utils/app_colors.dart';
import 'package:fit_flow/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  @override
  Widget build(BuildContext context) {
    final goals = _viewModel.goals;
    final state = _viewModel.state;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.offWhiteColor,
      ),
      child: Scaffold(
        backgroundColor: AppColors.offWhiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 64)),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 160),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 32),
                        Text(
                          'Select Your Goal',
                          style: AppStyles.nearBlackExtraBold34,
                        ),
                        const SizedBox(height: 7.3),
                        Text(
                          'Customize your journey for precision performance.',
                          style: AppStyles.grayBlueRegular15,
                        ),
                        const SizedBox(height: 32),
                        ...List.generate(goals.length, (index) {
                          final goal = goals[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index == goals.length - 1 ? 0 : 12,
                            ),
                            child: OnboardingGoalCard(
                              title: goal.title,
                              subtitle: goal.subtitle,
                              iconPath: goal.iconPath,
                              iconWidth: goal.iconWidth,
                              iconHeight: goal.iconHeight,
                              isSelected: state.selectedGoalIndex == index,
                              onTap: () => setState(
                                () => _viewModel.selectGoal(index),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 40),
                        Text(
                          'Weekly Availability',
                          style: AppStyles.nearBlackBold18,
                        ),
                        const SizedBox(height: 16),
                        OnboardingAvailabilitySelector(
                          selectedIndex: state.selectedDaysIndex,
                          labels: _viewModel.availabilityDays,
                          onSelected: (index) => setState(
                            () => _viewModel.selectDays(index),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const OnboardingRecommendedCard(),
                      ]),
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: OnboardingHeader(),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: OnboardingBottomActionBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
