import 'package:process/func.dart';
import 'package:process/models/process.dart';
import 'package:process/models/process_database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:process/widgets/process_card/process_card_counter.dart';

class ProcessCard extends StatefulWidget {
  final Process process;
  const ProcessCard({super.key, required this.process});

  @override
  State<ProcessCard> createState() => _ProcessCardState();
}

class _ProcessCardState extends State<ProcessCard> {
  void deleteProcess(BuildContext context, int id) {
    context.read<ProcessDataBase>().deleteProcess(id: id);
  }

  @override
  Widget build(BuildContext context) {
    String processInitDateAsString =
        dateTimeToString(context, widget.process.initDate);
    String processInitTimeAsString =
        hourTimeToString(context, widget.process.initDate);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.edit),
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
            ProcessCardCounter(process: widget.process)
          ],
        ),
      ),
    );
  }
}
