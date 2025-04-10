import 'package:isar/isar.dart';

part 'process.g.dart';

@Collection()
class Process {
  Id id = Isar.autoIncrement;
  late DateTime initDate;
  late String processName;
  bool processCompleted = false;
}
