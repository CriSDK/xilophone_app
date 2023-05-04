import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  Map<int, Color> mapColors = {
    1: Colors.pinkAccent,
    2: Colors.purpleAccent,
    3: Colors.deepPurple,
    4: Colors.deepPurpleAccent,
    5: Colors.indigo,
    6: Colors.blueAccent,
    7: Colors.greenAccent,
  };
  List<Widget> getMusicalNotes() {
    List<Widget> musicalNotes = [];
    for (int i = 1; i < 8; i++) {
      Widget note = Expanded(
        child: Container(
          color: mapColors[i],
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              audioCache.play(AssetSource('audios/note$i.wav'));
            },
            child: const Text(
              '',
            ),
          ),
        ),
      );
      musicalNotes.add(note);
    }
    return musicalNotes;
  }

  final AudioPlayer audioCache = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'Xilophone',
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: getMusicalNotes(),
            ),
          )),
    );
  }
}
