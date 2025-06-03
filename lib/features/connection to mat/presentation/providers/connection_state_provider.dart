import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/utils/enums/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/data/model/connection_type_model.dart';
import 'package:yoga_verse/features/connection%20to%20mat/domain/entity/connection_type.dart';
import 'package:yoga_verse/features/connection%20to%20mat/presentation/providers/mat_connection_provider.dart';
import 'package:yoga_verse/injection/initial_connection_state_providir.dart';

class MatConnectionStateNotifier
    extends StateNotifier<Map<MatConnectionType, ConnectionTypeModel>> {
  MatConnectionStateNotifier(super._state);

  void updateConnectionState({
    required MatConnectionType connectionType,
    required bool updateValue,
    String? deviceId,
  }) {
    state.update(
      connectionType,
      (value) => value.copyWith(isConnected: updateValue),
    );
    state = {...state};
  }
}

final connectionStateProvider = StateNotifierProvider<
  MatConnectionStateNotifier,
  Map<MatConnectionType, ConnectionTypeModel>
>((ref) {
  final initialState = ref.read(initConnectionStateProvider);

  return MatConnectionStateNotifier(initialState);
});
