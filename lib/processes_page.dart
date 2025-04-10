import 'package:process/models/process.dart';
import 'package:process/models/process_database.dart';
import 'package:process/providers/language_provider.dart';
import 'package:process/widgets/process_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProcessesPage extends StatefulWidget {
  const ProcessesPage({super.key});

  @override
  State<ProcessesPage> createState() => _ProcessesPageState();
}

class _ProcessesPageState extends State<ProcessesPage> {
  // DateTime? _initDateController;

  @override
  void initState() {
    super.initState();
    readProccurrentProcess();
  }

  void readProccurrentProcess() {
    context.read<ProcessDataBase>().fetchProcess();
  }

  void createNewProcess() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(0),
      lastDate: DateTime(3000),
    );
  }

  void updateProcess() {}

  void deleteProcess() {}
  @override
  Widget build(BuildContext context) {
    //////// CONTINUE https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                size: 50,
                Icons.punch_clock,
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.changeLanguage),
              leading: Icon(Icons.language),
              onTap: context.read<LanguageProvider>().toggleLanguage,
            ),
          ],
        ),
      ),
      body: currentProcess.isNotEmpty
          ? ListView.builder(
              itemCount: currentProcess.length,
              itemBuilder: (context, index) {
                return ProcessCard(process: currentProcess[index]);
              },
            )
          : Center(
              child: Column(
              children: [
                Text(AppLocalizations.of(context)!.noneProcessAddedYet),
                IconButton(
                  onPressed: createNewProcess,
                  icon: Icon(Icons.add),
                ),
              ],
            )),
    );
  }
}
