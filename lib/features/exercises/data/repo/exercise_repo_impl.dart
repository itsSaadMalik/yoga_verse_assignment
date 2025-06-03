import 'package:yoga_verse/features/exercises/data/data%20source/exercise_data_src_impl.dart';
import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/exercises/domain/repository/exercise_repo.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseDataSourceImpl exerciseDataSource;

  ExerciseRepositoryImpl({required this.exerciseDataSource});
  @override
  Future<ExerciseModel?> getExercise({required String exerciseID}) async =>
      await exerciseDataSource.getExercise(exerciseID: exerciseID);

  @override
  Future<List<ExerciseModel>> get getAllInbuiltExercises async =>
      exerciseDataSource.getInbuiltExerises;

  @override
  int get getExerciseListLength => exerciseDataSource.length;
}
