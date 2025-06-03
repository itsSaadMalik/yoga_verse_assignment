import 'package:yoga_verse/features/mat/data/model/yoga_mat_data_model.dart';
import 'package:yoga_verse/features/mat/domain/data%20source/simulation_data_src.dart';

class SimulationDataSourceImpl implements SimulationDataSource {
  @override
  List<YogaMatDataModel> get getSimulationDataFor => mockMatData;

  // the behavior will change for diff exercises
  List<YogaMatDataModel> mockMatData = [
    YogaMatDataModel(
      leftHandPressure: .0,
      rightHandPressure: .0,
      leftFootPressure: .0,
      rightFootPressure: .0,
    ),
    YogaMatDataModel(
      leftHandPressure: .2,
      rightHandPressure: .2,
      leftFootPressure: .3,
      rightFootPressure: .3,
    ),
    YogaMatDataModel(
      leftHandPressure: .3,
      rightHandPressure: .3,
      leftFootPressure: .2,
      rightFootPressure: .2,
    ),
    YogaMatDataModel(
      alignment: '',
      leftHandPressure: .0,
      rightHandPressure: .3,
      leftFootPressure: .5,
      rightFootPressure: .5,
    ),
    YogaMatDataModel(
      leftHandPressure: .0,
      rightHandPressure: .1,
      leftFootPressure: .6,
      rightFootPressure: .5,
    ),
    YogaMatDataModel(
      leftHandPressure: .0,
      rightHandPressure: .0,
      leftFootPressure: .6,
      rightFootPressure: .4,
    ),
    YogaMatDataModel(
      leftHandPressure: .2,
      rightHandPressure: .2,
      leftFootPressure: .4,
      rightFootPressure: .2,
    ),
  ];
}
