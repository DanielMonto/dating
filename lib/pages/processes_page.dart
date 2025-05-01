import 'package:process/models/process.dart';
import 'package:process/models/process_database.dart';
import 'package:process/widgets/create_process_or_update_dialog.dart';
import 'package:process/widgets/main_drawer.dart';
import 'package:process/widgets/process_card/process_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProcessesPage extends StatefulWidget {
  const ProcessesPage({super.key});

  @override
  State<ProcessesPage> createState() => _ProcessesPageState();
}

class _ProcessesPageState extends State<ProcessesPage> {
  @override
  void initState() {
    super.initState();
    readProcess();
  }

  void readProcess() {
    context.read<ProcessDataBase>().fetchProcess();
  }

  void createNewProcess() {
    showDialog(
        context: context, builder: (context) => CreateProcessOrUpdateDialog());
  }

  @override
  Widget build(BuildContext context) {
    final processDatabase = context.watch<ProcessDataBase>();
    List<Process> currentProcess = processDatabase.currentProcess;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewProcess,
          child: const Icon(Icons.add),
        ),
        drawer: MainDrawer(),
        body: currentProcess.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.noneProcessAddedYet),
                    IconButton(
                      onPressed: createNewProcess,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListView.builder(
                  itemCount: currentProcess.length,
                  itemBuilder: (context, index) {
                    return ProcessCard(process: currentProcess[index]);
                  },
                ),
              ));
  }
}
