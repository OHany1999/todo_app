import 'package:flutter/material.dart';
import 'package:todo_app/modules/tasks_list/task_item.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 36500),),
          lastDate: DateTime.now().add(Duration(days:36500 ),),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: black,
          dayColor: black,
          activeDayColor: white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor:white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        SizedBox(height: 10.0,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskItem(),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
