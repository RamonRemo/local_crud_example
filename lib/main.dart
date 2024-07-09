import 'package:flutter/material.dart';
import 'package:kanban_re/app/model/entity/task.dart';
import 'package:kanban_re/app/view/home_page.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Realm realm;

  _MyAppState() {
    final config = Configuration.local([Task.schema]);
    realm = Realm(config);
  }

  int get taskCount => realm.all<Task>().length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
