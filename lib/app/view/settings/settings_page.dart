import 'package:flutter/material.dart';
import 'package:kanban_re/app/controller/settings_controller.dart';
import 'package:localization/localization.dart';

class SettingsPage extends StatefulWidget {
  final SettingsController controller;
  const SettingsPage({super.key, required this.controller});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final settingsController = widget.controller;
  late String? darkMode = settingsController.getSettingValue('theme') ?? 'dark';
  late String? pageSwipe =
      settingsController.getSettingValue('page_swipe') ?? 'true';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      title: Text(
        'settings'.i18n(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  _body(context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          _themeTile(context),
          const Spacer(),
          Text(
            'v0.0.1',
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }

  ListTile _themeTile(context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'dark_mode'.i18n(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
      trailing: Switch(
        value: (darkMode == 'dark'),
        onChanged: (value) async {
          darkMode = value ? 'dark' : 'light';

          setState(() {
            settingsController.addSettings(
              key: 'theme',
              value: darkMode!,
            );
          });
        },
      ),
    );
  }
}
