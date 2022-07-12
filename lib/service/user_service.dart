import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static String name = '';
  static String scholarID = '';

  UserService(String userName, String userScholarID) {
    name = userName;
    scholarID = userScholarID;
  }

  void insertUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('scholarID', scholarID);

    print('$name ---------> $scholarID');
  }

  Future<String> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('name')!;
  }

  Future<String> getUserScholarID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('scholarID')!;
  }
}
