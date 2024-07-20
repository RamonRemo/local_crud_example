import 'package:kanban_re/app/model/entity/settings.dart';
import 'package:realm/realm.dart';

class SettingsDatabase {
  SettingsDatabase._internal();
  static final SettingsDatabase _instance = SettingsDatabase._internal();
  
  static late Realm realm;


  factory SettingsDatabase() {
    var config = Configuration.local([Settings.schema]);
    realm = Realm(config);

    return _instance;
  }

  void create(Settings settings) {
    realm.write(() {
      realm.add(settings);
    });
  }

  void edit(Settings settings) {
    realm.write(() {
      realm.add(settings, update: true);
    });
  }

  void delete(Settings settings) {
    realm.write(() {
      realm.delete(settings);
    });
  }

  RealmResults<Settings> getAll() {
    return realm.all<Settings>();
  }
}
