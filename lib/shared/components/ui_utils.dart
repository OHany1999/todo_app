import 'package:flutter/material.dart';

void showLoading(String message, BuildContext context) {
  showDialog(
    //ده يخلي الشاشة دي متقفلش ابدا
    barrierDismissible: false,
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: AlertDialog(
              actions: [
                Text(message),
                CircularProgressIndicator(),
              ],
            ),
          )
        )
        );
}

void showMessage(String message, BuildContext context,String posBtn,VoidCallback posAction){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text(message),
      actions: [
        TextButton(onPressed: posAction, child: Text(posBtn))
      ],

    );
  });
}
void hideLoading(BuildContext context){
Navigator.pop(context);
}
