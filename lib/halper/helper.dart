import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String usessrEmailKey = "USEREMAILKEY";

  //save data to sp

  //getting th data from sp
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences localDatasource = await SharedPreferences.getInstance();

    return localDatasource.getBool(userLoggedInKey);
  }
}
