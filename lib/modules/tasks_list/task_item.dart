import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/modules/tasks_list/add_update_bottom_sheet.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';
import 'package:todo_app/shared/styles/colors.dart';

import '../../models/task.dart';


class TaskItem extends StatelessWidget {
  Task task;
  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 1/2,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context){
                DeleteTaskFromFireStore(task.id);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: (context){
                showUpdateTaskBottomSheet(context,task.id);
              },
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              label: 'Edit',
              borderRadius: BorderRadius.circular(12),
            ),
      ],
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Theme.of(context).colorScheme.onPrimary)),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 80,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${task.title}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${task.description}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.done,
                  color: white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showUpdateTaskBottomSheet(BuildContext context,String id) {
    showModalBottomSheet(
      context: context,
      builder: (context) => UpdateBottomSheet(id),
    );
  }
}
