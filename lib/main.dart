import 'package:process/pages/processes_page.dart';
import 'package:process/models/process_database.dart';
import 'package:process/providers/global_timer.dart';
import 'package:process/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProcessDataBase.initializeDataBase();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProcessDataBase()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ChangeNotifierProvider(create: (context) => GlobalTimer()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkLanguageSettingStored();
  }

  void checkLanguageSettingStored() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLocalCode = prefs.getString('languageCode');
    if (storedLocalCode != null) {
      context.read<LanguageProvider>().setLanguage(storedLocalCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localeLanguage = context.watch<LanguageProvider>().localLanguage;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: localeLanguage,
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: ThemeData.dark(),
      home: Builder(builder: (context) {
        return ProcessesPage();
      }),
    );
  }
}
