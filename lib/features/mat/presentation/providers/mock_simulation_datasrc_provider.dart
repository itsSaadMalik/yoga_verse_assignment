import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/features/mat/data/data%20source/simulation_data_src_impl.dart';
import 'package:yoga_verse/features/mat/domain/data%20source/simulation_data_src.dart';

final mockSimulationDataProvider = Provider<SimulationDataSource>((ref) {
  return SimulationDataSourceImpl();
});
