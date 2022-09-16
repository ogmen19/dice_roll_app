import 'package:dice_roll/constants.dart';
import 'package:dice_roll/players.dart';
import 'package:flutter/material.dart';

import 'first_page_view.dart';



class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 100,
        child: Card(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [ 
                 Text('${players[0].name}\n${players[0].score}',style: const TextStyle(fontSize: ThemeDimensions.scoreBoardTextSize)),
                 Text('${players[1].name}\n${players[1].score}',style: const TextStyle(fontSize: ThemeDimensions.scoreBoardTextSize))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
