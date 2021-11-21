import 'package:flutter/material.dart';

class ResetForm extends StatelessWidget {
  late final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}