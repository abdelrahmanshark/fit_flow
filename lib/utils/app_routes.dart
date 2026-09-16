import 'package:fit_flow/cubit/get_onboarding_goals_cubit.dart';
import 'package:fit_flow/data/repositories/onboarding_goals_repository_impl.dart';
import 'package:fit_flow/data/services/onboarding_goals_service.dart';
import 'package:fit_flow/ui/onboarding_view/onboarding_view.dart';
import 'package:fit_flow/ui/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    onboarding: (context) => BlocProvider(
          create: (_) => GetOnboardingGoalsCubit(
            OnboardingGoalsRepositoryImpl(OnboardingGoalsService()),
          ),
          child: const OnboardingView(),
        ),
  };
}
