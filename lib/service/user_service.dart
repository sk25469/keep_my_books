import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static String name = '';
  static String scholarID = '';

  UserService(String userName, String userScholarID) {
    name = userName;
    scholarID = userScholarID;
  }

  static setInitialValues() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString('name')!;
    scholarID = sharedPreferences.getString('scholarID')!;
  }

  void insertUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('scholarID', scholarID);
    sharedPreferences.setBool('isLoggedIn', true);

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
