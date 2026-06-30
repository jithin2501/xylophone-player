import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Widget buildKey({
    required Color color,
    required int soundNumber,
    required String note,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(20),
          elevation: 8,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white24,
            highlightColor: Colors.white10,
            onTap: () {
              playSound(soundNumber);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    note,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.music_note, color: Colors.white, size: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Xylophone",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0F2027), Color(0xff203A43), Color(0xff2C5364)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Xylophone",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: Column(
                    children: [
                      buildKey(
                        color: Colors.redAccent,
                        soundNumber: 1,
                        note: "Do",
                      ),
                      buildKey(
                        color: Colors.orange,
                        soundNumber: 2,
                        note: "Re",
                      ),
                      buildKey(color: Colors.amber, soundNumber: 3, note: "Mi"),
                      buildKey(color: Colors.green, soundNumber: 4, note: "Fa"),
                      buildKey(color: Colors.teal, soundNumber: 5, note: "Sol"),
                      buildKey(color: Colors.blue, soundNumber: 6, note: "La"),
                      buildKey(
                        color: Colors.deepPurple,
                        soundNumber: 7,
                        note: "Ti",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Tap a key to play music 🎵",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
