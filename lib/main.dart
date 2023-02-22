import 'package:flutter/material.dart';
import 'package:job_upskill/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Profile Upskilling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          fontFamily: "Leela"),
      home: const LoadingScreen(),
      routes: {LoadingScreen.id: (context) => const LoadingScreen()},
    );
  }
}
