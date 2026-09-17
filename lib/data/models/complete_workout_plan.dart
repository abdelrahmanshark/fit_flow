import 'package:fit_flow/data/models/exercise.dart';
import 'package:fit_flow/data/models/plan.dart';

class CompleteWorkoutExercise {
  const CompleteWorkoutExercise({
    required this.exercise,
    required this.defaultSet,
    required this.setCount,
  });

  final Exercise exercise;
  final ExerciseSet defaultSet;
  final int setCount;
}

class CompleteWorkoutDay {
  const CompleteWorkoutDay({
    required this.dayNumber,
    required this.titleEn,
    required this.titleAr,
    required this.durationMinutes,
    required this.exercises,
  });

  final int dayNumber;
  final String titleEn;
  final String titleAr;
  final int durationMinutes;
  final List<CompleteWorkoutExercise> exercises;

  String titleForLocale(String languageCode) {
    return languageCode == 'ar' ? titleAr : titleEn;
  }
}

class CompleteWorkoutPlan {
  const CompleteWorkoutPlan({
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
  final List<CompleteWorkoutDay> workoutDays;

  String scheduleNotesForLocale(String languageCode) {
    return languageCode == 'ar' ? scheduleNotesAr : scheduleNotesEn;
  }
}
