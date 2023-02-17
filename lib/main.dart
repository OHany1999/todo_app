// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/layout.dart';
import 'package:todo_app/shared/provider/settingsProvider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  late SettingProvider settingProvider;

  @override
  Widget build(BuildContext context) {
    settingProvider = Provider.of<SettingProvider>(context);
    getValueFromShared();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(settingProvider.language),
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName :(context)=> HomeLayout(),
      },
      debugShowCheckedModeBanner:false ,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingProvider.themeMode,
    );
  }

  void getValueFromShared()async{
    final prefs = await SharedPreferences.getInstance();

    //get language from sharedPreference
    //if null first time make it en 'en'
    settingProvider.ChangeLanguage(prefs.getString('lang') ?? 'en');

    //get Theme from sharedPreference
    if(prefs.getString("theme") == "light"){
      settingProvider.ChangeMode(ThemeMode.light);
    }else if(prefs.getString("theme")=="dark"){
      settingProvider.ChangeMode(ThemeMode.dark);
    }else{
      settingProvider.ChangeMode(ThemeMode.light);
    }

  }
}

