import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{

ThemeMode themeMode = ThemeMode.light;

void ChangeMode(ThemeMode theme){
  themeMode = theme;
  notifyListeners();
}

}