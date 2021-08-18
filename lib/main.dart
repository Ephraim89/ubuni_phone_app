import 'package:flutter/material.dart';
// import 'package:ubuni_phone_app/screens/home.dart';
import 'package:ubuni_phone_app/screens/phones_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Shop',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PhoneList(),
    );
  }
}