
import 'package:flutter/material.dart';
import 'package:team_app/data/employee.dart';
import 'package:team_app/widgets/login_form.dart';
import 'package:team_app/widgets/primary_button.dart';
import 'bottom_nav_screen.dart';
import 'forgotpass_page.dart';
import 'signup.dart';

class LogInScreen extends StatelessWidget {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  Employee emp = Employee();
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
                Colors.blue.shade800,
                Colors.blue.shade600,
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
                        "ยินดีต้อนรับ",
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
                            onTap: () {
                              if ((Email.text == "chavisa@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "chavisa@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "ronachai@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "ronachai@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "panita@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "panita@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "wipawan@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "wipawan@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "orapan@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "orapan@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "ganokporn@gmail.com") &&
                                  (Password.text == "1234")) {
                                print(Email.text + " pass " + Password.text);
                                emp.setUser(Email.text, "ganokporn@gmail.com");
                                gotoHomePage(context);
                              }
                              if ((Email.text == "test") &&
                                  (Password.text == "123")) {
                                //saveLogin(Email.text, "Test");
                                emp.setUser(Email.text, "test");
                                gotoHomePage(context);
                              } else {
                                print("error");
                                num = num + 1;
                                if (num > 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordScreen(),
                                    ),
                                  );
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('เข้าสู่ระบบสำเร็จเเล้ว')),
                                );
                              }
                            },
                            child: PrimaryButton(buttonText: 'เข้าสู่ระบบ'),
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
