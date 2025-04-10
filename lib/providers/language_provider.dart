import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale localLanguage = Locale('en');

  Future<void> setLanguage(
    String newLanguageString,
  ) async {
    localLanguage = Locale(newLanguageString);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', newLanguageString);
  }

  void toggleLanguage() async {
    if (localLanguage.languageCode == 'es') {
      await setLanguage('en');
    } else {
      await setLanguage('es');
    }
  }
}
