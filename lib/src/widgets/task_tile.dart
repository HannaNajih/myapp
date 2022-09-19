import 'package:flutter/material.dart';

import '../models/task.dart';
import 'theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
    this.task, {
    Key? key,
  }) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(bottom: 10),
      height: 200,
      width: 350,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: _getBGColor(task.color),
        ),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title!,
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: grayIconClr,
                          size: 18,
                        ),
                        Text(
                          '${task.startTime}-${task.endTime}',
                          style: typingTextStyle,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('data')
                  ],
                ),
              ),
            ),
            Container(
              color: Globgreen,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isComplete == 0 ? 'TODO' : 'Completed',
                style: typingTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

//am methoda drwst akain takw ba nrxy integer ka daman nawa
//valuey rangakan return kain w bam shewaya nabeta error w property color
//qbwli akat
  _getBGColor(int? color) {
    switch (color) {
      case 0:
        return Globgreen;
      case 1:
        return selectionGrayClor;
      case 2:
        return Colors.red;
      case 3:
        return Colors.pinkAccent;
      case 4:
        return Colors.blueGrey;
      default:
        return Globgreen;
    }
  }
}
