import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:process/func.dart';
import 'package:process/models/process_database.dart';
import 'package:provider/provider.dart';

class CreateProcessDialog extends StatefulWidget {
  const CreateProcessDialog({super.key});

  @override
  State<CreateProcessDialog> createState() => _CreateProcessDialogState();
}

class _CreateProcessDialogState extends State<CreateProcessDialog> {
  final TextEditingController _processNameController = TextEditingController();
  DateTime _dateController = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateController = DateTime.now();
  }

  @override
  void dispose() {
    _processNameController.dispose();
    super.dispose();
  }

  void changeHour(TimeOfDay? newHour) {
    if (newHour == null) return;
    setState(() {
      _dateController = DateTime(
        _dateController.year,
        _dateController.month,
        _dateController.day,
        newHour.hour,
        newHour.minute,
      );
    });
  }

  void changeDate(DateTime? newDate) {
    if (newDate == null) return;
    setState(() {
      _dateController = DateTime(
        newDate.year,
        newDate.month,
        newDate.day,
        _dateController.hour,
        _dateController.minute,
      );
    });
  }

  void addProcess(BuildContext context) {
    context.read<ProcessDataBase>().addProcess(
        initDateChooseFromUser: _dateController,
        processNameFromUser: _processNameController.text);
    _processNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String dateAsString = dateTimeToString(context, _dateController);
    String hourAsString = hourTimeToString(context, _dateController);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(appLocalizations.createNewProcess),
      content: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _processNameController,
                decoration: InputDecoration(
                    label: Text(appLocalizations.nameYourProcess)),
              ),
              Text(appLocalizations.initDate),
              TextButton.icon(
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(-3000),
                    lastDate: DateTime.now(),
                  );
                  changeDate(datePicked);
                },
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white30,
                    width: 1.5,
                  ),
                ),
                icon: Icon(Icons.calendar_today),
                label: Text(dateAsString),
              ),
              Text(appLocalizations.initHour),
              TextButton.icon(
                onPressed: () async {
                  TimeOfDay? timePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: _dateController.hour,
                        minute: _dateController.minute),
                    builder: (BuildContext context, Widget? child) {
                      return Localizations.override(
                        context: context,
                        locale: Locale('en'),
                        child: MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!,
                        ),
                      );
                    },
                  );
                  changeHour(timePicked);
                },
                style: TextButton.styleFrom(
                  side: BorderSide(
                    color: Colors.white30,
                    width: 1.5,
                  ),
                ),
                icon: Icon(Icons.access_alarm),
                label: Text(hourAsString),
              ),
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            _processNameController.clear();
            Navigator.of(context).pop();
          },
          child: Text(appLocalizations.cancel),
        ),
        MaterialButton(
          onPressed: () {
            if (_processNameController.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(appLocalizations.giveAName),
                  content: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Text(appLocalizations.giveAProcessName),
                        TextField(
                          controller: _processNameController,
                          decoration: InputDecoration(
                            label: Text(appLocalizations.nameYourProcess),
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        _processNameController.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text(appLocalizations.cancel),
                    ),
                    MaterialButton(
                      onPressed: () {
                        addProcess(context);
                      },
                      child: Text(appLocalizations.create),
                    )
                  ],
                ),
              ).then((_) {
                Navigator.of(context).pop();
              });
            } else if (_processNameController.text.isNotEmpty) {
              addProcess(context);
            }
          },
          child: Text(appLocalizations.create),
        ),
      ],
    );
  }
}
