import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefModel {
  // static String name = '';
  static String id = '';
  static String pw = '';
  static bool darkMode = false;
  static late SharedPreferences prefs;

  static initialize() async {
    prefs = await SharedPreferences.getInstance();
    darkMode = prefs.getBool('darkMode') ?? false;
    id = prefs.getString('id') ?? '';
    pw = prefs.getString('pw') ?? '';
  }

  static setDarkMode(bool stat) {
    darkMode = stat;
    prefs.setBool('darkMode', stat);
  }

  static setAccount(String id, String pw) {
    SharedPrefModel.id = id;
    SharedPrefModel.pw = pw;
    prefs.setString('id', id);
    prefs.setString('pw', pw);
  }

  static clearAccount() {
    SharedPrefModel.id = '';
    SharedPrefModel.pw = '';
    prefs.setString('id', '');
    prefs.setString('pw', '');
  }
}
