import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/database/database_initialization.dart';
import 'package:rentaroo/home.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentaroo',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        primary: Color(0xffbb9c36),
        secondary: Color(0xff794328),
        background: Color(0xffd4c4bc),
      )),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
