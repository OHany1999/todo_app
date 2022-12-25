// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/shared/components/ui_utils.dart';
import 'package:todo_app/shared/network/local/firebase_utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Colors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.blue,),
                    controller: titleController,
                    validator: (text) {
                      if (text!.isEmpty && text != null) {
                        return 'Title is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Title',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.blue,),
                    maxLines: 4,
                    controller: descriptionController,
                    validator: (text) {
                      if (text!.isEmpty && text != null) {
                        return 'Description is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Description',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Select Date',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showDate();
              },
              child: Text(
                '${DateFormat('EEEE, MMM d, yyyy').format(selectedDate)}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: 22),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  showMessage(
                      'Are you sure ?',
                      context,
                      'Ok',
                        (){
                        addTaskToFireStore(
                            Task(
                            title: titleController.text
                            , description: descriptionController.text,
                            date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
                            )
                        ).then((value) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }).catchError((error){
                          print(error);
                        });
                        },
                    negBtn: 'Cancel',
                    negAction: (){
                        Navigator.pop(context);
                    },
                  );
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }

  void showDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 36500),
      ),
    );
    if (chosenDate == null) {
      return;
    }
    // date only بتخليه ياخد التاريخ بس مايخدش الوقت معاه كمان عشان ده بيعمل مشاكل في الداتا بتاعت الfirebase
    selectedDate = chosenDate;
    setState(() {});
  }
}
