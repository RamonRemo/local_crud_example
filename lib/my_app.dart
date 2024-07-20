import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kanban_re/app/controller/settings_controller.dart';
import 'package:kanban_re/app/view/home/home_page.dart';
import 'package:kanban_re/app/view/settings/settings_page.dart';
import 'package:kanban_re/app/view/splash/splash.dart';
import 'package:kanban_re/config/theme.dart';
import 'package:kanban_re/config/util.dart';
import 'package:localization/localization.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settingsController = SettingsController();

  @override
  void initState() {
    settingsController.settings.changes.listen((changes) {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    TextTheme textTheme = createTextTheme(context, "PT Serif", "PT Serif");

    MaterialCustomTheme theme = MaterialCustomTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: settingsController.getSettingValue('theme') == 'light'
          ? theme.light()
          : theme.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'), // Portuguese
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(title: 'Home'),
        '/settings': (context) => SettingsPage(controller: settingsController),
      },
    );
  }
}

class MaterialTheme {}
