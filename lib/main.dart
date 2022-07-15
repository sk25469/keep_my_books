import 'package:flutter/material.dart';
import 'package:library_sys/screen/login_screen.dart';
import 'package:library_sys/service/user_service.dart';
import 'package:library_sys/widget/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  bool hasLoggedIn = sharedPreferences.containsKey('isLoggedIn')
      ? sharedPreferences.getBool('isLoggedIn')!
      : false;
  UserService.setInitialValues();
  runApp(
    MyApp(hasLoggedIn: hasLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  final bool hasLoggedIn;
  const MyApp({Key? key, required this.hasLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: !hasLoggedIn ? const LoginScreen() : const BottomNavigationScreen(),
    );
  }
}
