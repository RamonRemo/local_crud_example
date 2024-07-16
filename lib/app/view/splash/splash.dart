// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadConfig();
  }

  void loadConfig() async {
    await Future.delayed(const Duration(milliseconds: 200));
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Teste',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
