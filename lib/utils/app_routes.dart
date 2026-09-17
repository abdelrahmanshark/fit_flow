import 'package:fit_flow/cubit/get_complete_workout_plan_cubit.dart';
import 'package:fit_flow/cubit/get_onboarding_goals_cubit.dart';
import 'package:fit_flow/data/repositories/exercises_repository_impl.dart';
import 'package:fit_flow/data/repositories/onboarding_goals_repository_impl.dart';
import 'package:fit_flow/data/repositories/plans_repository_impl.dart';
import 'package:fit_flow/data/services/exercises_service.dart';
import 'package:fit_flow/data/services/onboarding_goals_service.dart';
import 'package:fit_flow/data/services/plans_service.dart';
import 'package:fit_flow/domain/use_cases/create_complete_workout_plan_use_case.dart';
import 'package:fit_flow/ui/onboarding_view/onboarding_view.dart';
import 'package:fit_flow/ui/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    onboarding: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => GetOnboardingGoalsCubit(
                OnboardingGoalsRepositoryImpl(OnboardingGoalsService()),
              ),
            ),
            BlocProvider(
              create: (_) => GetCompleteWorkoutPlanCubit(
                CreateCompleteWorkoutPlanUseCase(
                  PlansRepositoryImpl(PlansService()),
                  ExercisesRepositoryImpl(ExercisesService()),
                ),
              ),
            ),
          ],
          child: const OnboardingView(),
        ),
  };
}
