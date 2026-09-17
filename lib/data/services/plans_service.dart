import 'dart:convert';

import 'package:fit_flow/data/models/plan.dart';
import 'package:fit_flow/utils/app_assets.dart';
import 'package:flutter/services.dart';

class PlansService {
  Future<List<Plan>> fetchPlans() async {
    final raw = await rootBundle.loadString(AppAssets.plansJson);
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final plansJson = decoded['plans'] as List<dynamic>;

    return plansJson
        .map((item) => Plan.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
