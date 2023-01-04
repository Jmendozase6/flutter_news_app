import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  //
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isShowedSplash => _prefs.getBool('isShowedSplash') ?? false;

  static set isShowedSplash(bool value) =>
      _prefs.setBool('isShowedSplash', true);

  static bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;

  static set isDarkMode(bool value) => _prefs.setBool('isDarkMode', true);
}
