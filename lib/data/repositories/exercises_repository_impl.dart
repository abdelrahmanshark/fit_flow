import 'package:fit_flow/data/models/exercise.dart';
import 'package:fit_flow/data/services/exercises_service.dart';
import 'package:fit_flow/domain/repositories/exercises_repository.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  ExercisesRepositoryImpl(this._service);

  final ExercisesService _service;

  @override
  Future<List<Exercise>> getExercises() {
    return _service.fetchExercises();
  }
}
