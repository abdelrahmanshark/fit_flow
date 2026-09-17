import 'package:fit_flow/cubit/change_language_cubit.dart';
import 'package:fit_flow/cubit/get_complete_workout_plan_cubit.dart';
import 'package:fit_flow/cubit/get_onboarding_goals_cubit.dart';
import 'package:fit_flow/data/models/onboarding_state.dart';
import 'package:fit_flow/generated/l10n.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewModel _viewModel = OnboardingViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<GetOnboardingGoalsCubit>().getOnboardingGoals();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel.syncLanguageFromLocale(
      context.read<ChangeLanguageCubit>().state,
    );
  }

  Future<void> _onLanguageSelected(OnboardingLanguage language) async {
    _viewModel.selectLanguage(language);
    await context.read<ChangeLanguageCubit>().changeLanguage(
          _viewModel.localeFor(language),
        );
    setState(() {});
  }

  void _onContinue() {
    context.read<GetCompleteWorkoutPlanCubit>().getCompleteWorkoutPlan(
          _viewModel.input,
        );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final locale = Localizations.localeOf(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<GetOnboardingGoalsCubit, GetOnboardingGoalsState>(
          listener: (context, cubitState) {
            _viewModel.handleGetOnboardingGoalsState(cubitState);
            setState(() {});
          },
        ),
        BlocListener<GetCompleteWorkoutPlanCubit, GetCompleteWorkoutPlanState>(
          listener: (context, cubitState) {
            _viewModel.handleGetCompleteWorkoutPlanState(cubitState);
            setState(() {});
            if (cubitState is GetCompleteWorkoutPlanFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(cubitState.message)),
              );
            }
          },
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                            s.onboardingSelectYourGoal,
                            style: AppStyles.nearBlackExtraBold34,
                          ),
                          const SizedBox(height: 7.3),
                          Text(
                            s.onboardingCustomizeJourney,
                            style: AppStyles.grayBlueRegular15,
                          ),
                          const SizedBox(height: 32),
                          if (_viewModel.isGoalsLoading)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          else if (_viewModel.goalsError != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Text(
                                _viewModel.goalsError!,
                                style: AppStyles.grayBlueRegular15,
                              ),
                            )
                          else
                            ...List.generate(_viewModel.goals.length, (index) {
                              final goal = _viewModel.goals[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: index == _viewModel.goals.length - 1
                                      ? 0
                                      : 12,
                                ),
                                child: OnboardingGoalCard(
                                  title: _viewModel.goalTitle(goal, locale),
                                  subtitle: goal.subtitle(s),
                                  iconPath: goal.iconPath,
                                  iconWidth: goal.iconWidth,
                                  iconHeight: goal.iconHeight,
                                  isSelected:
                                      _viewModel.input.goalId == goal.id,
                                  onTap: () => setState(
                                    () => _viewModel.selectGoal(goal.id),
                                  ),
                                ),
                              );
                            }),
                          const SizedBox(height: 40),
                          Text(
                            s.onboardingWeeklyAvailability,
                            style: AppStyles.nearBlackBold18,
                          ),
                          const SizedBox(height: 16),
                          OnboardingAvailabilitySelector(
                            selectedIndex: _viewModel.input.selectedDaysIndex,
                            labels: _viewModel.availabilityDays(s),
                            onSelected: (index) => setState(
                              () => _viewModel.selectDaysByIndex(index),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const OnboardingRecommendedCard(),
                        ]),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: OnboardingHeader(
                    languageLabel: _viewModel.languageLabel(s),
                    onLanguageSelected: _onLanguageSelected,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: OnboardingBottomActionBar(
                    isLoading: _viewModel.isCreatingPlan,
                    onContinue: _onContinue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
