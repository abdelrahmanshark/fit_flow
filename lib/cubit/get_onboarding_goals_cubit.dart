import 'package:fit_flow/data/models/onboarding_goal.dart';
import 'package:fit_flow/domain/repositories/onboarding_goals_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GetOnboardingGoalsState {
  const GetOnboardingGoalsState();
}

class GetOnboardingGoalsInitial extends GetOnboardingGoalsState {
  const GetOnboardingGoalsInitial();
}

class GetOnboardingGoalsLoading extends GetOnboardingGoalsState {
  const GetOnboardingGoalsLoading();
}

class GetOnboardingGoalsSuccess extends GetOnboardingGoalsState {
  const GetOnboardingGoalsSuccess(this.goals);

  final List<OnboardingGoal> goals;
}

class GetOnboardingGoalsFailure extends GetOnboardingGoalsState {
  const GetOnboardingGoalsFailure(this.message);

  final String message;
}

class GetOnboardingGoalsCubit extends Cubit<GetOnboardingGoalsState> {
  GetOnboardingGoalsCubit(this._repository)
      : super(const GetOnboardingGoalsInitial());

  final OnboardingGoalsRepository _repository;

  Future<void> getOnboardingGoals() async {
    emit(const GetOnboardingGoalsLoading());
    try {
      final goals = await _repository.getOnboardingGoals();
      emit(GetOnboardingGoalsSuccess(goals));
    } catch (error) {
      emit(GetOnboardingGoalsFailure(error.toString()));
    }
  }
}
