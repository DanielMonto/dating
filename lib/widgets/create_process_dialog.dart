import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  String dateTimeToString() {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Map<int, String> weekDays = {
      1: appLocalizations.monday,
      2: appLocalizations.tuesday,
      3: appLocalizations.wednesday,
      4: appLocalizations.thursday,
      5: appLocalizations.friday,
      6: appLocalizations.saturday,
      7: appLocalizations.sunday,
    };
    Map<int, String> months = {
      1: appLocalizations.january,
      2: appLocalizations.february,
      3: appLocalizations.march,
      4: appLocalizations.april,
      5: appLocalizations.may,
      6: appLocalizations.june,
      7: appLocalizations.july,
      8: appLocalizations.august,
      9: appLocalizations.september,
      10: appLocalizations.october,
      11: appLocalizations.november,
      12: appLocalizations.december,
    };
    String dateTimeAsString = appLocalizations.dateAsString(
      weekDays[_dateController.weekday] ?? '',
      months[_dateController.month] ?? '',
      '${_dateController.day}',
      '${_dateController.year}',
    );
    return dateTimeAsString;
  }

  String hourTimeToString() {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    String hourTimeAsString = _dateController.hour <= 12
        ? '${_dateController.hour}:${_dateController.minute} ${appLocalizations.am}'
        : '${_dateController.hour - 12}:${_dateController.minute} ${appLocalizations.pm}';
    return hourTimeAsString;
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

  @override
  Widget build(BuildContext context) {
    String dateAsString = dateTimeToString();
    String hourAsString = hourTimeToString();
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.createNewProcess),
      content: Column(
        children: [
          TextField(
            controller: _processNameController,
            decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.nameYourProcess)),
          ),
          Text(AppLocalizations.of(context)!.initDate),
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
          Text(AppLocalizations.of(context)!.initHour),
          TextButton.icon(
            onPressed: () async {
              TimeOfDay? timePicked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
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
      actions: [
        MaterialButton(
          onPressed: () {
            _processNameController.clear();
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        MaterialButton(
          onPressed: () {
            if (_processNameController.text.isNotEmpty) {
              context.read<ProcessDataBase>().addProcess(
                  initDateChooseFromUser: _dateController,
                  processNameFromUser: _processNameController.text);
              _processNameController.clear();
            }
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.create),
        ),
      ],
    );
  }
}
