import 'dart:math';

import 'package:dice_icons/dice_icons.dart';
import 'package:dice_roll/core/main_appbar/appbar_view.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../players.dart';

var players = [
  Player(name: 'Player-1', isTurn: true),
  Player(name: 'Player-2', isTurn: false)
];

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

int _index = 0;
String winner = '';

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  int firstBlock = 0;
  int leftDice = 1;
  int rightDice = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    //_controller.forward();
    animation.addListener(() {
      setState(() {});
      print(_controller.value);
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDice = Random().nextInt(6) + 1;
          rightDice = Random().nextInt(6) + 1;
          changeScores();
        });
        print('Completed');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  void changeTurn() {
    setState(() {
      players[0].isTurn = !players[0].isTurn;
      players[1].isTurn = !players[1].isTurn;

      if (players[0].score >= 10 || players[1].score >= 10) {
        winner = players[0].score > players[1].score
            ? players[0].name
            : players[1].name;
        _index = 1;
      }
    });
  }

  void changeScores() {
    if (players[0].isTurn) {
      players[0].score += leftDice;
    } else {
      players[1].score += leftDice;
    }
  }

  void resetGame() {
    setState(() {
      players[0].score = 0;
      players[1].score = 0;
      players[0].isTurn = true;
      players[1].isTurn = false;
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: IndexedStack(index: _index, children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 70),
                const Text(
                  'Scoreboard',
                  style: TextStyle(
                      color: ThemeColors.mainThemeColor1, fontSize: 30),
                ),
                SizedBox(
                  width: 250,
                  height: 80,
                  child: Card(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: ThemeDimensions.scoreBoardContainerSize,
                              width: ThemeDimensions.scoreBoardContainerSize,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(players[0].isTurn
                                      ? Icons.arrow_downward
                                      : null),
                                  Text('P-1: ${players[0].score}',
                                      style: const TextStyle(
                                          fontSize: ThemeDimensions
                                              .scoreBoardTextSize)),
                                ],
                              )),
                          const SizedBox(width: 30),
                          Container(
                              height: ThemeDimensions.scoreBoardContainerSize,
                              width: ThemeDimensions.scoreBoardContainerSize,
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(players[1].isTurn
                                      ? Icons.arrow_downward
                                      : null),
                                  Text('P-2: ${players[1].score}',
                                      style: const TextStyle(
                                          fontSize: ThemeDimensions
                                              .scoreBoardTextSize)),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Image(
                  height: 200 - (_controller.value * 200),
                  width: 130,
                  image: AssetImage('assets/images/dice-png-$leftDice.png'),
                )
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                    child: Column(
                  children: [
                    const Text(
                      ' Game Over',
                      style: TextStyle(
                          color: ThemeColors.mainThemeColor1, fontSize: 40),
                    ),
                    Text(
                      '$winner has won the game',
                      style: const TextStyle(
                          color: ThemeColors.mainThemeColor1, fontSize: 30),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 80,
                  width: 200,
                  child: InkWell(
                    onTap: resetGame,
                    child: const Card(
                        child: Center(
                            child: Text(
                      'Play Again',
                      style: TextStyle(color: ThemeColors.mainThemeColor2),
                    ))),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.mainThemeColor1,
        onPressed: () {
          roll();
          Future.delayed(
              const Duration(
                milliseconds: 800,
              ),
              changeTurn);
        },
        child: const Icon(
          DiceIcons.dice5,
        ),
      ),
    );
  }
}
