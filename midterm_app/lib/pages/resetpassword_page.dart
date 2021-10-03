import 'package:flutter/material.dart';
import 'package:midterm_app/pages/login_page.dart';
import 'package:midterm_app/widgets/primary_button.dart';
import 'package:midterm_app/widgets/resetpassword_form.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Reset Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Please enter your email address"),
              ResetForm(),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
                child: PrimaryButton(buttonText: "Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}