import 'package:dice_roll/constants.dart';
import 'package:flutter/material.dart';
import 'core/main_pages.dart/first_page.dart/first_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: ThemeColors.mainThemeColor2),
        inputDecorationTheme: ThemeTextField(),
        textTheme: const TextTheme(
          headline1: TextStyle(color: ThemeColors.mainThemeColor2),
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 60,
          color: ThemeColors.mainThemeColor1,
        ),
        cardTheme: CardTheme(
            color: ThemeColors.mainThemeColor1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}
