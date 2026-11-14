import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:substructure_daily/models/value_prefab.dart';

import '../../data/prefab_repository.dart';
import 'prefab_state.dart';

class PrefabCubit extends Cubit<PrefabState> {
  final PrefabRepository _repository;

  PrefabCubit(this._repository) : super(const PrefabState());

  Future<void> loadPrefabs() async {
    try {
      final prefabs = await _repository.loadValuePrefabs();
      emit(state.copyWith(status: PrefabStatus.success, prefabs: prefabs));
    } catch (e) {
      emit(
        state.copyWith(
          status: PrefabStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> addPrefab({
    required String title,
    required double value,
    double? subValue,
  }) async {
    final prefab = ValuePrefab()
      ..title = title
      ..value = value
      ..subValue = (subValue != null && subValue > 0) ? subValue : 0;

    try {
      await _repository.saveValuePrefab(prefab);
      await loadPrefabs();
    } catch (e) {
      emit(
        state.copyWith(
          status: PrefabStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> removeTask(ValuePrefab itemTask) async {
    try {
      await _repository.removeValuePrefab(itemTask);
      await loadPrefabs();
    } catch (e) {
      emit(
        state.copyWith(
          status: PrefabStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
