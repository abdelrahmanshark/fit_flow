class ExerciseSet {
  const ExerciseSet({
    required this.type,
    required this.metric,
    required this.value,
    required this.weightKg,
    required this.restSeconds,
  });

  final String type;
  final String metric;
  final String value;
  final double? weightKg;
  final int restSeconds;

  factory ExerciseSet.fromJson(Map<String, dynamic> json) {
    return ExerciseSet(
      type: json['type'] as String,
      metric: json['metric'] as String,
      value: json['value'] as String,
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      restSeconds: json['rest_seconds'] as int,
    );
  }
}

class PlanWorkoutExercise {
  const PlanWorkoutExercise({
    required this.exerciseId,
    required this.defaultSet,
    required this.setCount,
  });

  final String exerciseId;
  final ExerciseSet defaultSet;
  final int setCount;

  factory PlanWorkoutExercise.fromJson(Map<String, dynamic> json) {
    return PlanWorkoutExercise(
      exerciseId: json['exercise_id'] as String,
      defaultSet: ExerciseSet.fromJson(
        json['default_set'] as Map<String, dynamic>,
      ),
      setCount: json['set_count'] as int,
    );
  }
}

class PlanWorkoutDay {
  const PlanWorkoutDay({
    required this.dayNumber,
    required this.titleEn,
    required this.titleAr,
    required this.durationMinutes,
    required this.workoutExercises,
  });

  final int dayNumber;
  final String titleEn;
  final String titleAr;
  final int durationMinutes;
  final List<PlanWorkoutExercise> workoutExercises;

  String titleForLocale(String languageCode) {
    return languageCode == 'ar' ? titleAr : titleEn;
  }

  factory PlanWorkoutDay.fromJson(Map<String, dynamic> json) {
    final title = json['workout_title'] as Map<String, dynamic>;
    final exercises = json['workout_exercises'] as List<dynamic>;

    return PlanWorkoutDay(
      dayNumber: json['day_number'] as int,
      titleEn: title['en'] as String,
      titleAr: title['ar'] as String,
      durationMinutes: json['duration_minutes'] as int,
      workoutExercises: exercises
          .map(
            (item) =>
                PlanWorkoutExercise.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Plan {
  const Plan({
    required this.planId,
    required this.goalId,
    required this.level,
    required this.availabilityDays,
    required this.scheduleNotesEn,
    required this.scheduleNotesAr,
    required this.workoutDays,
  });

  final String planId;
  final String goalId;
  final String level;
  final int availabilityDays;
  final String scheduleNotesEn;
  final String scheduleNotesAr;
  final List<PlanWorkoutDay> workoutDays;

  String scheduleNotesForLocale(String languageCode) {
    return languageCode == 'ar' ? scheduleNotesAr : scheduleNotesEn;
  }

  factory Plan.fromJson(Map<String, dynamic> json) {
    final notes = json['schedule_notes'] as Map<String, dynamic>;
    final days = json['workout_days'] as List<dynamic>;

    return Plan(
      planId: json['plan_id'] as String,
      goalId: json['goal_id'] as String,
      level: json['level'] as String,
      availabilityDays: json['availability_days'] as int,
      scheduleNotesEn: notes['en'] as String,
      scheduleNotesAr: notes['ar'] as String,
      workoutDays: days
          .map(
            (item) => PlanWorkoutDay.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
