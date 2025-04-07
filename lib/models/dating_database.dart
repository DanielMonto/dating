import 'package:date/models/dating.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

class DatingDataBase extends ChangeNotifier {
  static late Isar isar;
  final List<Dating> currentDatings = [];

  static Future<void> initializeDataBase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([DatingSchema], directory: dir.path);
  }

  Future<void> addDating(DateTime dateChooseFromUser) async {
    final newDating = Dating()..date = dateChooseFromUser;
    await isar.writeTxn(() => isar.datings.put(newDating));
    fetchDatings();
  }

  Future<void> fetchDatings() async {
    List<Dating> fetchedDatings = await isar.datings.where().findAll();
    currentDatings.clear();
    currentDatings.addAll(fetchedDatings);
    notifyListeners();
  }

  Future<void> updateDating(int id, DateTime newDateChooseFroUser) async {
    final existingDating = await isar.datings.get(id);
    if (existingDating != null) {
      existingDating.date = newDateChooseFroUser;
      await isar.writeTxn(() => isar.datings.put(existingDating));
      await fetchDatings();
    }
  }

  Future<void> deleteDating(int id) async {
    await isar.writeTxn(() => isar.datings.delete(id));
    await fetchDatings();
  }
}
