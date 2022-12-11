import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/modules/tasks_list/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/shared/provider/TaskProvide.dart';
import 'package:todo_app/shared/styles/colors.dart';

import '../../shared/network/local/firebase_utils.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      builder: (context, widget) {
        var pro = Provider.of<TaskProvider>(context);
        return Column(
          children: [
            CalendarTimeline(
              showYears: true,
              initialDate: pro.dateTime,
              firstDate: DateTime.now().subtract(
                Duration(days: 36500),
              ),
              lastDate: DateTime.now().add(
                Duration(days: 36500),
              ),
              onDateSelected: (date) => {
                pro.changeDate(date),
              },
              leftMargin: 20,
              monthColor: black,
              dayColor: black,
              activeDayColor: white,
              activeBackgroundDayColor: Theme.of(context).primaryColor,
              dotsColor: white,
              selectableDayPredicate: (date) => true,
              locale: 'en_ISO',
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot<Task>>(
                future: getDataFromFireStore(pro.dateTime),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: (Text('Somethis went wrong')),
                    );
                  }
                  List<Task> taskData =
                      snapshot.data!.docs.map((e) => e.data()).toList() ?? [];
                  return ListView.builder(
                    itemBuilder: (context, index) => TaskItem(taskData[index]),
                    itemCount: taskData.length,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
