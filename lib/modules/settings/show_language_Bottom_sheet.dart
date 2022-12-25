import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/provider/settingsProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage('en');
              Navigator.pop(context);
            },
            child: themeItem(
              context,
              AppLocalizations.of(context)!.english,
              provider.language == 'en' ? true : false,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanguage('ar');
              Navigator.pop(context);
            },
            child: themeItem(
              context,
              AppLocalizations.of(context)!.arabic,
              provider.language == 'ar' ? true : false,
            ),
          ),
        ],
      ),
    );
  }

  Widget themeItem(BuildContext context, String text, bool isSelected) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
          ),
          Icon(
            Icons.done,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ],
      );
}
