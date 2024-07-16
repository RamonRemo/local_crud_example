
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kanban_re/app/view/home/home_page.dart';
import 'package:kanban_re/app/view/splash/splash.dart';
import 'package:localization/localization.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
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
        '/home': (context) => const HomePage(title:'Home'),
      },
    );
  }
}