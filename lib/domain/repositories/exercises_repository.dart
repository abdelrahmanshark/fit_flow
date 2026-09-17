import 'package:fit_flow/data/models/exercise.dart';

abstract class ExercisesRepository {
  Future<List<Exercise>> getExercises();
}
