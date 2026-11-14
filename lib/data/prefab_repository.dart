import 'package:isar/isar.dart';

import '../models/value_prefab.dart';

class PrefabRepository {
  final Isar isar;

  PrefabRepository(this.isar);

  Future<List<ValuePrefab>> loadValuePrefabs() =>
      isar.valuePrefabs.where().findAll();

  Future<void> saveValuePrefab(ValuePrefab valuePrefab) async {
    await isar.writeTxn(() async {
      await isar.valuePrefabs.put(valuePrefab);
    });
  }

  Future<void> removeValuePrefab(ValuePrefab valuePrefab) async {
    await isar.writeTxn(() async {
      await isar.valuePrefabs.delete(valuePrefab.id);
    });
  }
}
