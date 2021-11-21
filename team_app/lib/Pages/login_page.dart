import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/constants/color_constant.dart';
import 'package:team_app/services/auth_service.dart';
import 'package:team_app/widgets/login_form.dart';
import 'package:team_app/widgets/primary_button.dart';
import 'bottom_nav_page.dart';
import 'hospital_home_page.dart';
import 'list_user_page.dart';
import 'patient_list_page.dart';
import 'resetpass_page.dart';
import 'signup_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final AuthService _authService = AuthService();

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  late int num = 0;

  gotoHomePage(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
    List<User> _userList = [];
    if (context.read<UserProvider>().userList != null) {
      _userList = context.read<UserProvider>().userList;
    }
    */

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                iBlueColor,
                iBlueColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "i-Covid",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "ผู้ใช้งานใหม่? กดลงทะเบียนตรงนี้",
                              style: TextStyle(
                                color: Colors.amber[300],
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          LogInForm(Email, Password),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ResetPasswordScreen()),
                              );
                            },
                            child: Text(
                              'ลืมรหัสผ่าน?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (Email.text.length == 0) {
                                _showDialog(context, 'กรุณาระบุอีเมล์');
                              } else if (Password.text.length == 0) {
                                _showDialog(context, 'กรุณาระบุรหัสผ่าน');
                              } else if (Email.text == 'admin' &&
                                  Password.text == 'P@ssw0rd') {
                                //print(ListUser());
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListUser(),
                                  ),
                                );
                              } else {
                                if (await _authService.signIn(
                                    Email.text, Password.text)) {
                                  if (await GetUserRole(
                                          Email.text, Password.text) ==
                                      1) {
                                    //ผู้ดูแลระบบ
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ListUser(),
                                      ),
                                    );
                                  } else if (await _authService.getRoleID(
                                          Email.text, Password.text) ==
                                      2) {
                                    //ผู้ใช้งานทั่วไป
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavScreen(),
                                        ));
                                  } else if (await _authService.getRoleID(
                                          Email.text, Password.text) ==
                                      3) {
                                    //โรงพยาบาล
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HospitalHomeScreen(),
                                        ));
                                  } else if (await _authService.getRoleID(
                                          Email.text, Password.text) ==
                                      4) {
                                    //สถานพยาบาลผู้ป่วยเฉพาะกิจ
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PatientListPage(),
                                        ));
                                  } else if (await _authService.getRoleID(
                                          Email.text, Password.text) ==
                                      5) {
                                    //ผู้ดูแลระบบของโรงพยาบาล

                                  } else if (await _authService.getRoleID(
                                          Email.text, Password.text) ==
                                      6) {
                                    //ผู้ดูแลระบบของสถานพยาบาลผู้ป่วยเฉพาะกิจ

                                  } else {
                                    _showDialog(context,
                                        'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
                                  }
                                } else {
                                  _showDialog(context,
                                      'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
                                }
                              }
                            },
                            child: PrimaryButton(
                                buttonText: 'เข้าสู่ระบบ',
                                buttonColor: iBlueColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('แจ้งเตือน'),
        content: Text(text),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ตกลง'))
        ],
      );
    },
  );
}

Future<bool> CheckUsernameValid(String _username, String _password) async {
  bool result = false;
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _username, password: _password);
    result = true;
  // ignore: nullable_type_in_catch_clause
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return result;
  /*bool result = false;
  
  for (int i = 0; i < _userList.length; i++) {
    if (_userList[i].email == _username && _userList[i].password == _password) {
      result = true;
    }
  }
  return result;
  */
}

// List<User>
Future<int> GetUserRole(String _username, String _password) async {
  int result = 0;

  await _firestore
      .collection('icovid_user')
      .where('email', isEqualTo: _username)
      .where('password', isEqualTo: _password)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((element) {
      result = element["roleID"];
    });
  });
  /*
  for (int i = 0; i < _userList.length; i++) {
    if (_userList[i].email == _username && _userList[i].password == _password) {
      result = _userList[i].roleId!;
    }
  }
  */
  return result;
}