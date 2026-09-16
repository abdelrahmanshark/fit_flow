import 'package:fit_flow/ui/onboarding_view/onboarding_view.dart';
import 'package:fit_flow/ui/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashView(),
    onboarding: (context) => const OnboardingView(),
  };
}
