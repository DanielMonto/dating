import 'package:date/models/dating.dart';
import 'package:date/models/dating_database.dart';
import 'package:date/widgets/dating_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatingsPage extends StatefulWidget {
  const DatingsPage({super.key});

  @override
  State<DatingsPage> createState() => _DatingsPageState();
}

class _DatingsPageState extends State<DatingsPage> {
  // DateTime? _initDateController;

  @override
  void initState() {
    super.initState();
    readDatings();
  }

  void readDatings() {
    context.read<DatingDataBase>().fetchDatings();
  }

  void createNewDating() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(0),
      lastDate: DateTime(3000),
    );
  }

  void updateDating() {}

  void deleteDating() {}
  @override
  Widget build(BuildContext context) {
    final datingDatabase = context.watch<DatingDataBase>();
    List<Dating> currentDatings = datingDatabase.currentDatings;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Processes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewDating,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                size: 50,
                Icons.punch_clock,
              ),
            ),
            ListTile(),
          ],
        ),
      ),
      body: currentDatings.isNotEmpty
          ? ListView.builder(
              itemCount: currentDatings.length,
              itemBuilder: (context, index) {
                return DatingCard(dating: currentDatings[index]);
              },
            )
          : Center(
              child: Column(
              children: [
                const Text('You can add a process by the add button below'),
                IconButton(
                  onPressed: createNewDating,
                  icon: Icon(Icons.add),
                ),
              ],
            )),
    );
  }
}
