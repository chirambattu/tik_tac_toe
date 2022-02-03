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
  List<Ticks> ticks = [
    Ticks(0, '', Colors.teal),
    Ticks(1, '', Colors.teal),
    Ticks(2, '', Colors.teal),
    Ticks(3, '', Colors.teal),
    Ticks(4, '', Colors.teal),
    Ticks(5, '', Colors.teal),
    Ticks(6, '', Colors.teal),
    Ticks(7, '', Colors.teal),
    Ticks(8, '', Colors.teal),
  ];
  String currentUser = 'X';

  void onClick(int index) {
    setState(() {
      if (ticks[index].player == '') {
        ticks[index].player = currentUser;
      }

      if ([ticks[0].player, ticks[1].player, ticks[2].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[3].player, ticks[4].player, ticks[5].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[6].player, ticks[7].player, ticks[8].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[0].player, ticks[3].player, ticks[6].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[1].player, ticks[4].player, ticks[7].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[2].player, ticks[5].player, ticks[8].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[0].player, ticks[4].player, ticks[8].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      } else if ([ticks[2].player, ticks[4].player, ticks[6].player]
          .every((element) => element == currentUser)) {
        ticks[0].background = Colors.green;
        ticks[1].background = Colors.green;
        ticks[2].background = Colors.green;
      }

      currentUser = currentUser == 'X' ? 'O' : 'X';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
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
    );
  }
}

class Ticks {
  int key;
  String player;
  Color background;
  Ticks(this.key, this.player, this.background);
}
