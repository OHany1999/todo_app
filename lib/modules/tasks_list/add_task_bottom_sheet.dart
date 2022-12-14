import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
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
                    controller: titleController,
                    validator: (text){
                      if(text!.isEmpty && text != null ){
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
                    maxLines: 4,
                    controller: descriptionController,
                    validator: (text){
                      if(text!.isEmpty && text != null ){
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
            Text(
              '25/5/2022',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 22),),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
              onPressed: () {
                if(formkey.currentState!.validate()){
                  Navigator.pop(context);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
