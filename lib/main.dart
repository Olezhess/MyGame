import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Игра от Олега',
      home: MyAppRandom(),
    );
  }
}

class MyAppRandom extends StatefulWidget {
  const MyAppRandom({Key? key}) : super(key: key);

  @override
  _MyAppRandomState createState() => _MyAppRandomState();
}

class _MyAppRandomState extends State<MyAppRandom> {
  int? guess;
  late int randomNumber;

  @override
  void initState() {
    super.initState();
    generateRandomNumber();
  }

  void generateRandomNumber() {
    setState(() {
      randomNumber = Random().nextInt(10) + 1;
    });
  }

  void checknum() {
    if (guess != null) {
      if (guess == randomNumber) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Поздравляем! Вы угадали! \n Загаданное число было: ${randomNumber}'),
            );
          },
        );
      }
    } else if(guess != randomNumber) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Вы не угадали число :((( \n Загаданное число было: ${randomNumber}'),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Игра от Олега',
            style: TextStyle(
              fontFamily: 'Monospace',
              fontSize: 40,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Угадай число от 1 до 10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontFamily: 'Monospace',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  guess = int.parse(value);
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontFamily: 'Monospace',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: checknum,
        tooltip: 'Проверить',
        child: Icon(Icons.check),
      ),
    );
  }
}