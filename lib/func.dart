import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String addZeroIfLessThanTen(number) {
  return '${"$number".length < 2 ? "0$number" : number}';
}

String dateTimeToString(BuildContext context, DateTime date) {
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
    weekDays[date.weekday] ?? '',
    addZeroIfLessThanTen(months[date.month]),
    addZeroIfLessThanTen('${date.day}'),
    '${date.year}',
  );
  return dateTimeAsString;
}

String hourTimeToString(BuildContext context, DateTime date) {
  AppLocalizations appLocalizations = AppLocalizations.of(context)!;
  String hourTimeAsString = date.hour <= 12
      ? '${date.hour}:${addZeroIfLessThanTen(date.minute)} ${appLocalizations.am}'
      : '${date.hour - 12}:${addZeroIfLessThanTen(date.minute)} ${appLocalizations.pm}';
  return hourTimeAsString;
}
