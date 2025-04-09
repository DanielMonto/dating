import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale localLanguage = Locale('es'); // Default language

  Future<void> initLanguage(Locale deviceLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final languageSetting = prefs.getString('languageSetting');
    if (languageSetting == null) {
      if (deviceLocale.languageCode == 'es') {
        await setLanguage('es');
      } else {
        await setLanguage('en');
      }
      return;
    }
    await setLanguage(languageSetting);
  }

  Future<void> setLanguage(
    String newLanguageString,
  ) async {
    localLanguage = Locale(newLanguageString);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageSetting', newLanguageString);
  }
}
