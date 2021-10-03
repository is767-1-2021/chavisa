import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  const Blank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blank Page"),
      ),
      body: Center(
        child: Text("Blank Page"),
      ),
    );
  }
}