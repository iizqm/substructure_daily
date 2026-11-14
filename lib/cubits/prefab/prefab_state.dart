import '../../models/value_prefab.dart';

enum PrefabStatus { initial, loading, success, failure }

class PrefabState {
  final PrefabStatus status;
  final List<ValuePrefab> prefabs;
  final String? errorMessage;

  const PrefabState({
    this.status = PrefabStatus.initial,
    this.prefabs = const [],
    this.errorMessage,
  });

  PrefabState copyWith({
    PrefabStatus? status,
    List<ValuePrefab>? prefabs,
    String? errorMessage,
  }) {
    return PrefabState(
      status: status ?? this.status,
      prefabs: prefabs ?? this.prefabs,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
