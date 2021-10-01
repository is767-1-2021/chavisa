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
                height: 50,
              ),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Already a member?',
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SignUpForm(_formKey, firstName, lastName, email, cid, phon,
                  password, _Confirpassword),
              SizedBox(
                height: 20,
              ),
              CheckBox('Agree to terms and conditions.'),
              SizedBox(
                height: 20,
              ),
              CheckBox('I have at least 18 years old.'),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  CheckValueSignUp(
                      _formKey, context, password, _Confirpassword);
                },
                child: PrimaryButton(buttonText: 'Sign Up'),
              ),
              SizedBox(
                height: 50,
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
        const SnackBar(content: Text('Success')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('passwork is problem')),
      );
    }
  }
}