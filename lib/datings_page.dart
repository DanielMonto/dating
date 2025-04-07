import 'package:date/models/dating_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatingsPage extends StatefulWidget {
  const DatingsPage({super.key});

  @override
  State<DatingsPage> createState() => _DatingsPageState();
}

class _DatingsPageState extends State<DatingsPage> {
  void readDatings() {
    context.read<DatingDataBase>().fetchDatings();
  }

  void createNewDating() {}

  void uodateDating() {}

  void deleteDating() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fechas'),
      ),
    );
  }
}
