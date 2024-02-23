import 'package:flutter/material.dart';
import 'package:store/home.dart';
import 'package:store/page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(
        primaryColor: const Color(0xff017EFF),
        canvasColor: Colors.grey[100],
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900
          ),
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff017EFF)
          )
        ),
      ),
      routes: {
        'home': (context) => const Home(),
      },
    );
  }
}