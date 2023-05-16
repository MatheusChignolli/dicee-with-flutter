import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var random = Random();
  var dices = [1, 2, 3, 4, 5, 6];

  void _onPressed() {
    var newDices =
        List<int>.generate(dices.length, (i) => random.nextInt(6) + 1);
    setState(() {
      dices = newDices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: dices
            .map(
              (item) => Expanded(
                child: TextButton(
                  onPressed: _onPressed,
                  child: Image(
                    image: AssetImage('images/dice$item.png'),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
