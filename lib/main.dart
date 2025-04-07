import 'package:date/datings_page.dart';
import 'package:date/models/dating_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatingDataBase.initializeDataBase();
  runApp(ChangeNotifierProvider(
    create: (context) => DatingDataBase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DatingsPage(),
    );
  }
}
