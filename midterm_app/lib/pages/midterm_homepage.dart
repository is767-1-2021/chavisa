import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Midterm Homepage"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          buttonHome('log in Page', Icons.home, context, '/1'),
          buttonHome('Sign up Page', Icons.home, context, '/2'),
          buttonHome('Home', Icons.home, context, '/3'),
          buttonHome('Blank', Icons.home, context, '/4'),
          buttonHome('Blank', Icons.home, context, '/5'),
          buttonHome('Blank', Icons.home, context, '/6')
        ],
      ),
    );
  }
}

buttonHome(String nameButton, IconData iconButton, BuildContext context,
    String pageGo) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, pageGo);
    },
    child: Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameButton,
            style: TextStyle(fontSize: 18),
          ),
          Icon(iconButton),
        ],
      ),
    ),
  );
}