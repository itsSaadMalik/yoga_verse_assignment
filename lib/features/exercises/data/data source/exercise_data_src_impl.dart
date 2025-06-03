import 'package:yoga_verse/features/exercises/data/model/exercise_model.dart';
import 'package:yoga_verse/features/exercises/domain/data%20source/exercise_data_src.dart';

class ExerciseDataSourceImpl implements ExerciseDataSource {
  List<ExerciseModel> inbuiltExercises = [
    ExerciseModel(
      id: '1',
      title: 'Relaxation',
      position: 'sitting',
      duration: Duration(minutes: 3),
      leftHandPressure: .0,
      rightHandPressure: .0,
      rightFootPressure: .0,
      leftFootPressure: .0,
      comments:
          'sit/lay on the Mat and try to calm your thoughts and relax your body',
      posePictureData: 'assets/exercise pose images/sitting.png',
    ),
    ExerciseModel(
      id: '2',
      title: 'Breathing',
      position: 'Sitting',
      duration: Duration(minutes: 3),
      leftHandPressure: 0.0,
      rightHandPressure: 0.0,
      rightFootPressure: 0.0,
      leftFootPressure: 0.0,
      comments:
          'Sit comfortably at the center of the mat. Focus on deep inhales and exhales.',
      posePictureData: 'assets/exercise pose images/breathing.png',
    ),
    ExerciseModel(
      id: '3',
      title: 'Mountain Pose',
      position: 'Standing',
      duration: Duration(minutes: 3),
      leftHandPressure: 0.0,
      rightHandPressure: 0.0,
      leftFootPressure: 0.5,
      rightFootPressure: 0.5,
      comments: 'Stand tall with feet grounded evenly at the top of the mat.',
      posePictureData: 'assets/exercise pose images/mountain pose.png',
    ),
    ExerciseModel(
      id: '4',
      title: "Child's Pose",
      position: 'Kneeling',
      duration: Duration(seconds: 10),
      leftHandPressure: 0.3,
      rightHandPressure: 0.3,
      leftFootPressure: 0.2,
      rightFootPressure: 0.2,
      comments: 'Kneel at the back of the mat and stretch arms forward gently.',
      posePictureData: 'assets/exercise pose images/child pose.png',
    ),
    ExerciseModel(
      id: '5',
      title: 'Warm-up',
      position: 'sitting/standing',
      duration: Duration(seconds: 20),
      leftHandPressure: .0,
      rightHandPressure: .0,
      rightFootPressure: .0,
      leftFootPressure: .0,
      comments: 'sit/stant on the Mat and stretch your body (just a little)',
      posePictureData: 'assets/exercise pose images/warmup.png',
    ),
  ];
  @override
  List<ExerciseModel> get getInbuiltExerises => inbuiltExercises;

  @override
  Future<ExerciseModel?> getExercise({required String exerciseID}) async {
    try {
      final result = inbuiltExercises.firstWhere(
        (element) => element.id == exerciseID,
      );
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  int get length => inbuiltExercises.length;
}
