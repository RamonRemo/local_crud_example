import 'package:kanban_re/app/model/entity/task.dart';
import 'package:realm/realm.dart';

class TaskDatabase {
  TaskDatabase._internal();
  static late Realm realm;

  static final TaskDatabase _instance = TaskDatabase._internal();

  factory TaskDatabase() {
    var config = Configuration.local([Task.schema]);
    realm = Realm(config);

    return _instance;
  }

  void create(Task task) {
    realm.write(() {
      realm.add(task);
    });
  }

  void edit(Task task) {}

  void delete(Task task) {
    realm.write(() {
      realm.delete(task);
    });
  }

  RealmResults<Task> getAll() {
    return realm.all<Task>();
  }
}
