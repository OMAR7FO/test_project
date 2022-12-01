import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(fontSize: 18.0, color: Color(0xFF787878)),
          subtitle2: TextStyle(fontSize: 16.0, color: Color(0xFF787878)),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
