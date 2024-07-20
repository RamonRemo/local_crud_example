import 'package:kanban_re/app/model/database/setting_database.dart';
import 'package:kanban_re/app/model/entity/settings.dart';
import 'package:realm/realm.dart';

class SettingsController {
  final SettingsDatabase _settingsDatabase = SettingsDatabase();
  late RealmResults<Settings> settings;

  SettingsController() {
    settings = _settingsDatabase.getAll();
  }

  addSettings({required String key, required String value}) {
    bool settingExist = getSetting(key) != null;

    if (!settingExist) {
      _settingsDatabase.create(
        Settings(
          Uuid.v1(),
          key,
          value,
        ),
      );
    }

    if (settingExist) {
      _settingsDatabase.edit(
        Settings(
          getSetting(key).id,
          key,
          value,
        ),
      );
    }
  }

  getSetting(String key) {
    final setting = _retrieveSetting(key);

    if (setting.value != 'none') return setting;
  }

    getSettingValue(String key) {
    final setting = _retrieveSetting(key);

    if (setting.value != 'none') return setting.value;
  }

  _retrieveSetting(String key) {
    return settings.firstWhere(
      (setting) => setting.key == key,
      orElse: () => Settings(
        Uuid.v1(),
        'none',
        'none',
      ),
    );
  }
}
