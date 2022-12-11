import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier{

  DateTime dateTime = DateTime.now();

  void changeDate(DateTime date){
    dateTime = date;
    notifyListeners();
  }

}