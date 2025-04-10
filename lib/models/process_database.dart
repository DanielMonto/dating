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

  Future<void> addProcess(
    DateTime initDateChooseFromUser,
  ) async {
    final newProcess = Process()..initDate = initDateChooseFromUser;
    await isar.writeTxn(() => isar.process.put(newProcess));
    await fetchProcess();
  }

  Future<void> fetchProcess() async {
    List<Process> fetchedProcess = await isar.process.where().findAll();
    currentProcess.clear();
    currentProcess.addAll(fetchedProcess);
    notifyListeners();
  }

  Future<void> updateProcessInitDate(
    int id,
    DateTime newInitDateFromUser,
  ) async {
    final existingProcess = await isar.process.get(id);
    if (existingProcess == null) return;
    existingProcess.initDate = newInitDateFromUser;
    await isar.writeTxn(() => isar.process.put(existingProcess));
    await fetchProcess();
  }

  Future<void> deleteProcess(int id) async {
    await isar.writeTxn(() => isar.process.delete(id));
    await fetchProcess();
  }
}
