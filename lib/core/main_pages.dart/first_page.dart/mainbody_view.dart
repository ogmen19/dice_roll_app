import 'package:dice_roll/core/main_pages.dart/first_page.dart/scoreboard_view.dart';
import 'package:flutter/material.dart';

class MainBodyColumn extends StatelessWidget {
  const MainBodyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:const [
        
        ScoreBoard(),
      ],
    );
  }
}