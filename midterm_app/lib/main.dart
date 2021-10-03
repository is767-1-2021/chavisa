import 'package:flutter/material.dart';
import 'package:midterm_app/Models/Userform_model.dart';
import 'package:midterm_app/pages/blank_page.dart';
import 'package:midterm_app/pages/login_page.dart';
import 'package:midterm_app/pages/midterm_homepage.dart';
import 'package:midterm_app/pages/signup_page.dart';
import 'package:provider/provider.dart';


//import 'pages/bottom_nav_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'i-Covid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/3',
      routes: <String, WidgetBuilder>{
        '/1': (context) => LogInScreen(),
        '/2': (context) => SignUpScreen(),
        '/3': (context) => Home(),
        '/4': (context) => Blank(),
        '/5': (context) => Blank(),
        '/6': (context) => Blank(),
      },
    );
  }
}
