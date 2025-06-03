import 'package:yoga_verse/core/utils/enums/connection_type.dart';

abstract class NetworkStateRepository {
  Future<bool> isTurnedOn({required MatConnectionType connectionType});
  // Future<bool> isTurnedOn({MatConnectionType connectionType});
}
