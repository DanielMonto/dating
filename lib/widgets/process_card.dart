import 'package:process/models/process.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProcessCard extends StatelessWidget {
  final Process process;
  const ProcessCard({super.key, required this.process});

  String dateTimeToString(BuildContext context) {
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
      weekDays[process.initDate.weekday] ?? '',
      months[process.initDate.month] ?? '',
      '${process.initDate.day}',
      '${process.initDate.year}',
    );
    return dateTimeAsString;
  }

  String hourTimeToString(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    String hourTimeAsString = process.initDate.hour <= 12
        ? '${process.initDate.hour}:${process.initDate.minute} ${appLocalizations.am}'
        : '${process.initDate.hour - 12}:${process.initDate.minute} ${appLocalizations.pm}';
    return hourTimeAsString;
  }

  @override
  Widget build(BuildContext context) {
    String processInitDateAsString =
        "${dateTimeToString(context)} ${hourTimeToString(context)}";
    return Container(
      decoration: BoxDecoration(color: Colors.black54),
      child: Column(
        children: [Text(process.processName), Text(processInitDateAsString)],
      ),
    );
  }
}
