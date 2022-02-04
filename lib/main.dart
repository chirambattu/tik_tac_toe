import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
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
  List<Ticks> ticks = [];
  String currentUser = 'X';
  bool winner = false;

  void onClick(int index) {
    if (winner) {
      return;
    }
    setState(() {
      if (ticks[index].player == '') {
        ticks[index].player = currentUser;
        winner = true;
        if ([ticks[0].player, ticks[1].player, ticks[2].player]
            .every((element) => element == currentUser)) {
          ticks[0].background = Colors.green;
          ticks[1].background = Colors.green;
          ticks[2].background = Colors.green;
        } else if ([ticks[3].player, ticks[4].player, ticks[5].player]
            .every((element) => element == currentUser)) {
          ticks[3].background = Colors.green;
          ticks[4].background = Colors.green;
          ticks[5].background = Colors.green;
        } else if ([ticks[6].player, ticks[7].player, ticks[8].player]
            .every((element) => element == currentUser)) {
          ticks[6].background = Colors.green;
          ticks[7].background = Colors.green;
          ticks[8].background = Colors.green;
        } else if ([ticks[0].player, ticks[3].player, ticks[6].player]
            .every((element) => element == currentUser)) {
          ticks[0].background = Colors.green;
          ticks[3].background = Colors.green;
          ticks[6].background = Colors.green;
        } else if ([ticks[1].player, ticks[4].player, ticks[7].player]
            .every((element) => element == currentUser)) {
          ticks[1].background = Colors.green;
          ticks[4].background = Colors.green;
          ticks[7].background = Colors.green;
        } else if ([ticks[2].player, ticks[5].player, ticks[8].player]
            .every((element) => element == currentUser)) {
          ticks[2].background = Colors.green;
          ticks[5].background = Colors.green;
          ticks[8].background = Colors.green;
        } else if ([ticks[0].player, ticks[4].player, ticks[8].player]
            .every((element) => element == currentUser)) {
          ticks[0].background = Colors.green;
          ticks[4].background = Colors.green;
          ticks[8].background = Colors.green;
        } else if ([ticks[2].player, ticks[4].player, ticks[6].player]
            .every((element) => element == currentUser)) {
          ticks[2].background = Colors.green;
          ticks[4].background = Colors.green;
          ticks[6].background = Colors.green;
        } else {
          winner = false;
          currentUser = currentUser == 'X' ? 'O' : 'X';
        }
      }
    });
  }

  void resetTicks() {
    setState(() {
      ticks = [];
      for (var i = 0; i <= 8; i++) {
        ticks.add(Ticks(i, ''));
      }
      winner = false;
    });
  }

  @override
  void initState() {
    super.initState();
    resetTicks();
  }

  @override
  Widget build(BuildContext context) {
    //resetTicks();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: ticks
                    .map(
                      (e) => GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          //key: Key(e!['Key']),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            e.player,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 60),
                          ),
                          color: e.background,
                        ),
                        onTap: () {
                          onClick(e.key);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Column(children: <Widget>[
              winner
                  ? Text(
                      'The winner is ${currentUser}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  : Text(
                      'Next player ${currentUser}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
              winner
                  ? IconButton(
                      icon: const Icon(Icons.replay_circle_filled),
                      color: Colors.green,
                      iconSize: 50,
                      tooltip: 'Play again',
                      onPressed: () => resetTicks(),
                    )
                  : Container(),
            ]),
          )
        ],
      ),
    );
  }
}

class Ticks {
  int key;
  String player;
  Color background;
  Ticks(this.key, this.player, {this.background = Colors.grey});
}
