import 'package:process/func.dart';
import 'package:process/models/process.dart';
import 'package:process/models/process_database.dart';
import 'package:process/providers/global_timer.dart';
import 'package:process/widgets/create_process_or_update_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProcessCard extends StatefulWidget {
  final Process process;
  const ProcessCard({super.key, required this.process});

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  void updateProcess() {
    showDialog(
        context: context,
        builder: (context) =>
            CreateProcessOrUpdateDialog(process: widget.process));
  }

  void deleteProcess(BuildContext context, int id) {
    context.read<ProcessDataBase>().deleteProcess(id: id);
  }

  Map<String, String> calculateTimeUnits(DateTime startDate, DateTime now) {
    if (startDate.isAfter(now)) {
      return {
        'years': '0',
        'months': '0',
        'weeks': '0',
        'days': '0',
        'hours': '0',
        'minutes': '0',
      };
    }
    Duration difference = now.difference(startDate);
    int totalMinutes = difference.inMinutes;
    int minutes = totalMinutes % 60;
    int totalHours = totalMinutes ~/ 60;
    int hours = totalHours % 24;
    int totalDays = totalHours ~/ 24;
    int years = 0;
    int months = 0;
    int remainingDays = totalDays;

    DateTime tempDate =
        DateTime(startDate.year, startDate.month, startDate.day);

    while (remainingDays > 0) {
      int daysInCurrentMonth =
          DateTime(tempDate.year, tempDate.month + 1, 0).day;

      if (remainingDays >= daysInCurrentMonth) {
        remainingDays -= daysInCurrentMonth;
        months++;
        if (months == 12) {
          months = 0;
          years++;
        }
        tempDate = DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
      } else {
        break;
      }
    }
    int weeks = remainingDays ~/ 7;
    int days = remainingDays % 7;
    return {
      'years': '$years',
      'months': '$months',
      'weeks': '$weeks',
      'days': '$days',
      'hours': '$hours',
      'minutes': '$minutes',
    };
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    String processInitDateAsString =
        dateTimeToString(context, widget.process.initDate);
    String processInitTimeAsString =
        hourTimeToString(context, widget.process.initDate);
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      updateProcess();
                    },
                    icon: Icon(Icons.edit)),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        processInitDateAsString,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                      Text(
                        processInitTimeAsString,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      deleteProcess(context, widget.process.id);
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
            Text(
              widget.process.processName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Consumer<GlobalTimer>(builder: (context, timer, _) {
              DateTime now = timer.now;
              Map<String, String> sinceItHappenedTime =
                  calculateTimeUnits(widget.process.initDate, now);
              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['years'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.years),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['months'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.months),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['weeks'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.weeks),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['days'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.days),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['hours'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.hours),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sinceItHappenedTime['minutes'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(appLocalizations.minutes),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
