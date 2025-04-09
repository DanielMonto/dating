import 'package:isar/isar.dart';

part 'dating.g.dart';

@Collection()
class Dating {
  Id id = Isar.autoIncrement;
  late DateTime initDate;
  late String datingName;
  bool datingCompleted = false;
}
