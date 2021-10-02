import 'package:flutter/material.dart';
import 'package:team_app/widgets/checkbox.dart';
import 'package:team_app/widgets/primary_button.dart';
import 'package:team_app/widgets/signup_form.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cid = TextEditingController();
  TextEditingController phon = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController _Confirpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "ลงทะเบียนผู้ใช้งาน",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    '',
                    style: TextStyle(fontSize: 20),
              ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SignUpForm(_formKey, firstName, lastName, email, cid, phon,
                  password, _Confirpassword),
              SizedBox(
                height: 20,
              ),
              CheckBox('ผู้ใช้ยินยอมให้เก็บข้อมูล'),
              SizedBox(
                height: 15,
              ),
              CheckBox('ผู้ใช้งานมีอายุตั้งเเต่ 18 ปีขึ้นไป'),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  CheckValueSignUp(
                      _formKey, context, password, _Confirpassword);
                },
                child: PrimaryButton(buttonText: 'ยืนยันการลงทะเบียน'),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void CheckValueSignUp(_formKey, context, TextEditingController password,
    TextEditingController _Confirpassword) {
  if (_formKey.currentState!.validate()) {
    if (_Confirpassword.text == password.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ลงทะเบียนเรียบร้อยเเล้ว ให้ log in อีกครั้งเพื่อเข้าใช้งาน')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email หรือ รหัสผ่านไม่ถูกต้อง')),
      );
    }
  }
}