import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:process/func.dart';
import 'package:process/models/process.dart';
import 'package:process/models/process_database.dart';
import 'package:provider/provider.dart';

class CreateProcessOrUpdateDialog extends StatefulWidget {
  final Process? process;
  const CreateProcessOrUpdateDialog({super.key, this.process});

  @override
  State<CreateProcessOrUpdateDialog> createState() =>
      _CreateProcessOrUpdateDialogState();
}

class _CreateProcessOrUpdateDialogState
    extends State<CreateProcessOrUpdateDialog> {
  final TextEditingController _processNameController = TextEditingController();
  late DateTime _dateController;
  late bool _isCreateDialog;

  @override
  void initState() {
    super.initState();
    if (widget.process != null) {
      _isCreateDialog = false;
      _dateController = widget.process!.initDate;
      _processNameController.text = widget.process!.processName;
    } else {
      _isCreateDialog = true;
      _dateController = DateTime.now();
    }
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

  void addOrUpdateProcess(BuildContext context) {
    if (_isCreateDialog) {
      context.read<ProcessDataBase>().addProcess(
          initDateChooseFromUser: _dateController,
          processNameFromUser: _processNameController.text);
    } else {
      context.read<ProcessDataBase>().updateProcess(
            id: widget.process!.id,
            newInitDateFromUser: _dateController,
            newProcessNameFromUser: _processNameController.text,
          );
    }
    _processNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    String dateAsString = dateTimeToString(context, _dateController);
    String hourAsString = hourTimeToString(context, _dateController);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(
        _isCreateDialog
            ? appLocalizations.createNewProcess
            : appLocalizations.updateProcess,
      ),
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
                    initialDate: _dateController,
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
            if (_processNameController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(child: Text(appLocalizations.giveAName))));
            } else if (_processNameController.text.isNotEmpty) {
              addOrUpdateProcess(context);
            }
          },
          child: Text(
            _isCreateDialog ? appLocalizations.create : appLocalizations.update,
          ),
        ),
      ],
    );
  }
}
