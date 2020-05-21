import 'package:flutter/material.dart';
import 'package:pfe_project/login.dart';
import 'package:pfe_project/menudashboardpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Login(),
    );
  }
}


