import 'dart:convert';

import 'package:fit_flow/data/models/exercise.dart';
import 'package:fit_flow/utils/app_assets.dart';
import 'package:flutter/services.dart';

class ExercisesService {
  Future<List<Exercise>> fetchExercises() async {
    final raw = await rootBundle.loadString(AppAssets.exercisesJson);
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final exercisesJson = decoded['exercises'] as List<dynamic>;

    return exercisesJson
        .map((item) => Exercise.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
