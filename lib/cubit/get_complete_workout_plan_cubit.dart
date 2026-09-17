import 'package:fit_flow/data/models/complete_workout_plan.dart';
import 'package:fit_flow/data/models/onboarding_input.dart';
import 'package:fit_flow/domain/use_cases/create_complete_workout_plan_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GetCompleteWorkoutPlanState {
  const GetCompleteWorkoutPlanState();
}

class GetCompleteWorkoutPlanInitial extends GetCompleteWorkoutPlanState {
  const GetCompleteWorkoutPlanInitial();
}

class GetCompleteWorkoutPlanLoading extends GetCompleteWorkoutPlanState {
  const GetCompleteWorkoutPlanLoading();
}

class GetCompleteWorkoutPlanSuccess extends GetCompleteWorkoutPlanState {
  const GetCompleteWorkoutPlanSuccess(this.plan);

  final CompleteWorkoutPlan plan;
}

class GetCompleteWorkoutPlanFailure extends GetCompleteWorkoutPlanState {
  const GetCompleteWorkoutPlanFailure(this.message);

  final String message;
}

class GetCompleteWorkoutPlanCubit extends Cubit<GetCompleteWorkoutPlanState> {
  GetCompleteWorkoutPlanCubit(this._useCase)
      : super(const GetCompleteWorkoutPlanInitial());

  final CreateCompleteWorkoutPlanUseCase _useCase;

  Future<void> getCompleteWorkoutPlan(OnboardingInput input) async {
    emit(const GetCompleteWorkoutPlanLoading());
    try {
      final plan = await _useCase(input);
      emit(GetCompleteWorkoutPlanSuccess(plan));
    } catch (error) {
      emit(GetCompleteWorkoutPlanFailure(error.toString()));
    }
  }
}
