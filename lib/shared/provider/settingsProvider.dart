import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier{

ThemeMode themeMode = ThemeMode.light;

void ChangeMode(ThemeMode theme)async{
  final prefs = await SharedPreferences.getInstance();
  themeMode = theme;
  prefs.setString("theme", themeMode == ThemeMode.light? "light":"dark");
  notifyListeners();
}

String language= 'en';
void ChangeLanguage(String lang)async{
  final prefs = await SharedPreferences.getInstance();
  language = lang;
  prefs.setString("lang", language);
  notifyListeners();
}

}