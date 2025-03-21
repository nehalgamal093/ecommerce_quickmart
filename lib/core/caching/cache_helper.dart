import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late final SharedPreferences sharedPref;

  static init() async{
    sharedPref = await SharedPreferences.getInstance();
  }

  static void saveToken(String token){
    sharedPref.setString('token',token);
  }

  static String? getToken() {
    return sharedPref.getString('token');
  }
  static void clearToken() {
    sharedPref.remove('token');
  }
}