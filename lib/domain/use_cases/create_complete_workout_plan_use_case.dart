import 'package:fit_flow/data/models/complete_workout_plan.dart';
import 'package:fit_flow/data/models/onboarding_input.dart';
import 'package:fit_flow/domain/repositories/exercises_repository.dart';
import 'package:fit_flow/domain/repositories/plans_repository.dart';

class CreateCompleteWorkoutPlanUseCase {
  CreateCompleteWorkoutPlanUseCase(
    this._plansRepository,
    this._exercisesRepository,
  );

  final PlansRepository _plansRepository;
  final ExercisesRepository _exercisesRepository;

  Future<CompleteWorkoutPlan> call(OnboardingInput input) async {
    final (plans, exercises) = await (
      _plansRepository.getPlans(),
      _exercisesRepository.getExercises(),
    ).wait;

    final planId = input.planId;
    final matchingPlans = plans.where((plan) => plan.planId == planId);
    if (matchingPlans.isEmpty) {
      throw StateError('Plan not found for planId=$planId');
    }
    final plan = matchingPlans.first;

    final exercisesById = {
      for (final exercise in exercises) exercise.id: exercise,
    };

    final workoutDays = plan.workoutDays.map((day) {
      final completeExercises = day.workoutExercises.map((planExercise) {
        final exercise = exercisesById[planExercise.exerciseId];
        if (exercise == null) {
          throw StateError(
            'Exercise not found for exerciseId=${planExercise.exerciseId}',
          );
        }

        return CompleteWorkoutExercise(
          exercise: exercise,
          defaultSet: planExercise.defaultSet,
          setCount: planExercise.setCount,
        );
      }).toList();

      return CompleteWorkoutDay(
        dayNumber: day.dayNumber,
        titleEn: day.titleEn,
        titleAr: day.titleAr,
        durationMinutes: day.durationMinutes,
        exercises: completeExercises,
      );
    }).toList();

    return CompleteWorkoutPlan(
      planId: plan.planId,
      goalId: plan.goalId,
      level: plan.level,
      availabilityDays: plan.availabilityDays,
      scheduleNotesEn: plan.scheduleNotesEn,
      scheduleNotesAr: plan.scheduleNotesAr,
      workoutDays: workoutDays,
    );
  }
}
