import 'package:flutter/material.dart';
import 'package:infinitelist/screens/home_screen.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Uber Eats",
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.green),
        primaryColor:const Color(0xFF34495E),
      ),
      home: const HomeScreen(),
    );
  }
}
