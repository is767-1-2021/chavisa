import 'package:flutter/material.dart';
import 'package:midterm_app/models/Userform_model.dart';
import 'package:provider/src/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Sign In'),
      ),
      body: MySignForm(),
    );
  }
}

class MySignForm extends StatefulWidget {
  const MySignForm({Key? key}) : super(key: key);

  @override
  _MySignFormState createState() => _MySignFormState();
}

class _MySignFormState extends State<MySignForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _firstName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your firstname',
              icon: Icon(Icons.business),
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
              labelText: 'Enter your email',
              icon: Icon(Icons.business),
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
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<UserFormModel>().emailName = _email;
                context.read<UserFormModel>().firstName = _firstName;

                Navigator.pop(context);
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}