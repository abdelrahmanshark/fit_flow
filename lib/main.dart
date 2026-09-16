import 'package:fit_flow/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitFlow());
}

class FitFlow extends StatelessWidget {
  const FitFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
