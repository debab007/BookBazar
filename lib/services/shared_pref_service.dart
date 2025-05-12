import 'package:shared_preferences/shared_preferences.dart';



class PreferenceHelper {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  static Future<int> setuserID( int value) async
  {
    final prefs= await SharedPreferences.getInstance();
    await prefs.setInt("UserID", value);
    return 0;
  }
  static Future<int> getuserID() async
  {
    final prefs= await SharedPreferences.getInstance();
    return prefs.getInt("UserID") ?? -1;
  }
  static Future<int> setuserName( String value) async
  {
    final prefs= await SharedPreferences.getInstance();
    await prefs.setString("UserName", value);
    return 0;
  }
  static Future<String> getName() async
  {
    final prefs= await SharedPreferences.getInstance();
    return prefs.getString("UserName") ?? "None";
  }
  

  

}
