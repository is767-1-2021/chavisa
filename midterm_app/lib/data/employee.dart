import 'package:shared_preferences/shared_preferences.dart';

class Employee {
  //setter
  void setUser(String email, String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email);
    preferences.setString('username', username);
    
  }
}