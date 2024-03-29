import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/provider/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: themeItem(context, AppLocalizations.of(context)!.light,provider.themeMode == ThemeMode.light ? true:false),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: (){
              provider.ChangeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: themeItem(context, AppLocalizations.of(context)!.dark,provider.themeMode ==ThemeMode.dark?true:false),
          ),
        ],
      ),
    );
  }

  Widget themeItem(BuildContext context, String text, bool isSelected) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: isSelected == true?
                Colors.blue:Colors.grey,
            ),
          ),
          Icon(
              Icons.done,
            color: isSelected == true?
            Colors.blue:Colors.grey,
          ),
        ],
      );
}