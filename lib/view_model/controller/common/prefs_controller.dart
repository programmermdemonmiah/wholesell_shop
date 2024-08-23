import 'package:shared_preferences/shared_preferences.dart';

class PrefsController {
  static late SharedPreferences _prefarence;
  static Future<bool> onInit() async {
    _prefarence = await SharedPreferences.getInstance();
    return true;
  }

  //language Save =============

  static set setLanguage(String value) {
    try {
      _prefarence.setString("language", value).then(
            (value) => print("successfully add $value"),
          );
    } catch (e) {
      print(e.toString());
    }
  }

  static get getLanguage => _prefarence.getString("language");
}
