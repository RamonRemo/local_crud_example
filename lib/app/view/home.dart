import 'package:flutter/material.dart';
import 'package:kanban_re/app/controller/home_controller.dart';
import 'package:realm/realm.dart';

import '../model/entity/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [];
  HomeController controller = HomeController();

  void _addTask() {
    print(controller.taskList);

    controller.create(Task(Uuid.v1(), 'title', 0, subtitle: 'subtitle'));

    setState(() {});
  }

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
                    print('should edit');
                  },
                  icon: const Icon(
                    Icons.edit_square,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      controller.delete(controller.taskList[index]);
                    });
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
}
