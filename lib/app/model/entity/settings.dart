import 'package:realm/realm.dart';
part 'settings.realm.dart';


@RealmModel()
class _Settings {
  @PrimaryKey()
  late Uuid id;
  late String key;
  late String value;
}