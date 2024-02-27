import 'dart:convert';

import 'package:pago_facil_app/layers/layers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {
  AuthPreference(this._prefs);
  final SharedPreferences _prefs;

  Account? get getAccount {
    final accountString = _prefs.getString('_user');
    if (accountString != null) {
      return Account.fromMap(json.decode(accountString));
    }
    return null;
  }

  Future<void> setAccount(Account value) =>
      _prefs.setString('_user', json.encode(value.toMap()));

  Future<void> logout() async {
    await _prefs.remove('_user');
  }
}
