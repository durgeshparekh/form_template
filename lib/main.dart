import 'package:flutter/material.dart';
import 'package:form_template/home_screen.dart';
import 'package:get/get.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      theme: theme(),
      // theme: ThemeData(
      //   backgroundColor: Colors.white,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: kPrimaryColor,
      //   ),
      // ),
      home: const HomeScreen(),
    );
  }
}
