import 'package:flutter/material.dart';
import 'package:process/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              size: 50,
              Icons.access_alarm_sharp,
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.changeLanguage),
            leading: Icon(Icons.language),
            onTap: context.read<LanguageProvider>().toggleLanguage,
          ),
        ],
      ),
    );
  }
}
