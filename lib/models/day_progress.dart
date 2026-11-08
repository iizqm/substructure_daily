import 'package:isar/isar.dart';

part 'day_progress.g.dart';

@collection
class DayProgress {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime date;

  int totalScore = 0;
}
