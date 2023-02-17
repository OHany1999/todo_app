// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/settings/show_Theme_Bottom_sheet.dart';
import 'package:todo_app/modules/settings/show_language_Bottom_sheet.dart';
import 'package:todo_app/shared/provider/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border:
                Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                provider.themeMode == ThemeMode.light?
                AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border:
                Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                provider.language == 'en'?
                AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

}
