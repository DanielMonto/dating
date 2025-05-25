import 'package:process/models/process.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

class ProcessDataBase with ChangeNotifier {
  static late Isar isar;
  final List<Process> currentProcess = [];

  static Future<void> initializeDataBase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ProcessSchema], directory: dir.path);
  }

  Future<void> addProcess({
    required DateTime initDateChooseFromUser,
    required String processNameFromUser,
  }) async {
    final newProcess = Process()
      ..initDate = initDateChooseFromUser
      ..processName = processNameFromUser;
    await isar.writeTxn(() => isar.process.put(newProcess));
    currentProcess.add(newProcess);
    notifyListeners();
  }

  Future<void> fetchProcess() async {
    List<Process> fetchedProcess = await isar.process.where().findAll();
    currentProcess.clear();
    currentProcess.addAll(fetchedProcess);
    notifyListeners();
  }

  Future<void> updateProcess({
    required int id,
    required DateTime newInitDateFromUser,
    required String newProcessNameFromUser,
  }) async {
    final existingProcess = await isar.process.get(id);
    if (existingProcess == null) return;
    existingProcess.initDate = newInitDateFromUser;
    existingProcess.processName = newProcessNameFromUser;
    await isar.writeTxn(() => isar.process.put(existingProcess));
    final index = currentProcess.indexWhere((process) => process.id == id);
    if (index != -1) {
      currentProcess[index] = existingProcess;
      notifyListeners();
    }
  }

  Future<void> toggleProcessCompleted({required int id}) async {
    final existingProcess = await isar.process.get(id);
    if (existingProcess == null) return;
    existingProcess.processCompleted = !existingProcess.processCompleted;
    await isar.writeTxn(() => isar.process.put(existingProcess));
    final index = currentProcess.indexWhere((process) => process.id == id);
    if (index != -1) {
      currentProcess[index] = existingProcess;
      notifyListeners();
    }
  }

  Future<void> deleteProcess({required int id}) async {
    await isar.writeTxn(() => isar.process.delete(id));
    final index = currentProcess.indexWhere((process) => process.id == id);
    if (index != -1) {
      currentProcess.removeAt(index);
      notifyListeners();
    }
  }
}
