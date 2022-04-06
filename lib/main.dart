import 'package:codehouse_tugas5/injector.dart';
import 'package:codehouse_tugas5/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Codehouse TUGAS-5',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialBinding: Injector(),
      home: LoginPage(),
    );
  }
}
