// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/layout.dart';
import 'package:todo_app/shared/provider/settingsProvider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
          create: (context)=>SettingProvider(),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName :(context)=> HomeLayout(),
      },
      debugShowCheckedModeBanner:false ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}

