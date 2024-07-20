import 'package:flutter/material.dart';
import 'package:kanban_re/app/controller/home_controller.dart';
import 'package:realm/realm.dart';

import '../../model/entity/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [];
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: _body(context),
        floatingActionButton: _button());
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/settings');
          },
          icon: const Icon(Icons.settings),
        )
      ],
      title: Text(widget.title),
    );
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      itemCount: controller.taskList.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(controller.taskList[index].title),
          trailing: SizedBox(
            width: 100,
            // height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _editTask(index);
                  },
                  icon: const Icon(
                    Icons.edit_square,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _deleteTask(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  FloatingActionButton _button() {
    return FloatingActionButton(
      onPressed: _addTask,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void _addTask() {
    setState(() {
      controller.create(Task(Uuid.v1(), 'title', 0, subtitle: 'subtitle'));
    });
  }

  void _deleteTask(index) {
    setState(() {
      controller.delete(controller.taskList[index]);
    });
  }

  void _editTask(index) {
    final oldTask = controller.taskList[index];

    Task newTask = Task(
      oldTask.id,
      'new title',
      oldTask.status,
      subtitle: 'new subtitle',
    );

    setState(() {
      controller.edit(newTask);
    });
  }
}
