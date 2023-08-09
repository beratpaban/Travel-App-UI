import 'package:flutter/material.dart';
import 'package:travel_app/constants/color_constants.dart';
import 'package:travel_app/onboarding_page.dart';

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
        primaryColor: ColorConstants.mainColor,
        fontFamily: 'Inter',
      ),
      home: const OnBoardingPage(),
    );
  }
}
