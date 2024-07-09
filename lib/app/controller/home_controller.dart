import 'package:kanban_re/app/model/database/task_database.dart';
import 'package:kanban_re/app/model/entity/task.dart';
import 'package:realm/realm.dart';

class HomeController{
  TaskDatabase database = TaskDatabase();
  late RealmResults<Task> taskList;

  HomeController(){
    database.getAll();
    taskList = database.getAll();
  }

  void create(Task task){
    database.create(task);
  }

  void edit(Task task){
    database.edit(task);
  }

  void delete(Task task){
    database.delete(task);
  }

}