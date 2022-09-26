import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist_hive/ui/home.dart';
import 'package:todolist_hive/utils/colors.dart';

void main() {
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
