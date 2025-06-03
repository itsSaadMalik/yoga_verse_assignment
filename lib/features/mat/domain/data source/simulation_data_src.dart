import 'package:yoga_verse/features/mat/data/model/yoga_mat_data_model.dart';

abstract class SimulationDataSource {
  List<YogaMatDataModel> get getSimulationDataFor;
}
