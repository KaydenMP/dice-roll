import 'package:flutter/material.dart';

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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List diceImage = [1, 2, 3, 4, 5, 6];
  var LeftDiceNo = 1;
  var RightDiceNo = 5;

  void diceChange1() {
    setState(() {
      diceImage.shuffle();
      LeftDiceNo = diceImage[0];
    });
  }

  void diceChange2() {
    setState(() {
      diceImage.shuffle();
      RightDiceNo = diceImage[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Dice Num',
        style: TextStyle(
          fontFamily: 'Mouse',
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Padding(
              padding:  EdgeInsets.all(8.0),
              child:  Text('Player 1'),
            ),
            InkWell(
                onTap: () {
                  diceChange1();
                },
                child: Image(
                    image: AssetImage('assets/dice$LeftDiceNo.png'),
                    height: 150,
                    width: 150,
                    color: Colors.lime)),],),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text('Player 2'),
              ),
            InkWell(
              onTap: () {
                diceChange2();
              },
              child: Image(
                image: AssetImage('assets/dice$RightDiceNo.png'),
                height: 150,
                width: 150,
                color: Colors.lime,
              ),
            ),
            ],)
          ],
        ),
      ),
    );
  }
}
