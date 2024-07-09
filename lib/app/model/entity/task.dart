import 'package:realm/realm.dart';
part 'task.realm.dart';


@RealmModel()
class _Task {
  @PrimaryKey()
  late Uuid id;
  late String title;
  late String? subtitle;
  late int status;
}