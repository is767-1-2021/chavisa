import 'package:flutter/material.dart';
import 'package:midterm_app/Models/Userform_model.dart';
import 'package:midterm_app/widgets/checkbox.dart';
import 'package:midterm_app/widgets/primary_button.dart';
import 'package:provider/src/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String? _firstName;
  String? _lastName;
  String? _email;
  String? _cid;
  String? _phon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: _formKey,
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
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your firstname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter firstname.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value;
                  },
                  initialValue: context.read<UserFormModel>().firstName,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your lastname',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lastname.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value;
                  },
                  initialValue: context.read<UserFormModel>().lastName,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                  initialValue: context.read<UserFormModel>().emailName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your cid',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cid.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cid = value;
                  },
                  initialValue: context.read<UserFormModel>().cid,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your phon',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phon.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phon = value;
                  },
                  initialValue: context.read<UserFormModel>().phon,
                ),
                //SignUpForm(_formKey, firstName, lastName, email, cid, phon, password, _Confirpassword),
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
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<UserFormModel>().firstName = _firstName;
                      context.read<UserFormModel>().lastName = _lastName;
                      context.read<UserFormModel>().emailName = _email;
                      context.read<UserFormModel>().cid = _cid;
                      context.read<UserFormModel>().phon = _phon;

                      Navigator.pop(context);
                    }
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
      ),
    );
  }
}
