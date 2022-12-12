import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

// عن طريق الfunction دي تقدر تعمل access علي collection كامل اللي هيا الtable
CollectionReference<Task> getTaskCollection() {
  return
      //snapshot هو object من fireStore تقدر تعمل access علي كل حاجة بداخله
      FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
            //بتاخد منها الdate اللي في شكل map عشان تحولها لmodel
            //عشان تعرف تستقبل منها الdata
            fromFirestore: (snapshot, options) =>
                Task.fromJason(snapshot.data()!),
            toFirestore: (task, options) => task.toJson(),
          );
}

// collection يعني table
//document يعني Row بتفاصيل كاملة يعني row ليه data خاصة بيه ممكن تتغير من column لللاخر

Future<void> addTaskToFireStore(Task task) {
  var collection = getTaskCollection();
  //عملت create لdocument جديد
  var docRef = collection.doc();
  // الid بتاعي اللي ببعته من الmodel بيساوي اللي جايلي من الfirebase في الdocument
  //عشان اعمله create auto
  task.id = docRef.id;
  // ضيف الداتا من task model
  return docRef.set(task);
}

Stream<QuerySnapshot<Task>> getDataFromFireStore(DateTime dateTime) {
  var data = getTaskCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
  return data;
}

Future<void> DeleteTaskFromFireStore(String id) {
// امسح الdoc الي id بتاعه كذا
  return getTaskCollection().doc(id).delete();
}

Future<void> UpdateTaskFromFireStore(Task task, String id) {
// امسح الdoc الي id بتاعه كذا
  String oldId = '';
  var docRef = getTaskCollection().doc(id);
  task.id = docRef.id;
  return getTaskCollection().doc(id).update(task.toJson());
}
