import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist_hive/ui/home.dart';
import 'package:todolist_hive/utils/colors.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();
  // open a hive box
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: color2,
      ),
      home: const HomePage(),
    );
  }
}
