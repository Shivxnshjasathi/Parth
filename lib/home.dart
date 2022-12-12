import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parth2/speech.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textSample = 'Hey Parth !';
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AvatarGlow(
          endRadius: 150,
          animate: isListening,
          glowColor: Colors.white,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: toggleRecording,
            child: Icon(
              isListening ? Icons.circle : Icons.mic,
              size: 35,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100),
              child: Text(
                textSample,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 60,
                ),
              ),
            )));
  }

  Future toggleRecording() => Speech.toggleRecording(
      onResult: (String text) => setState(() {
            textSample = text;
          }),
      onListening: (bool isListening) {
        setState(() {
          this.isListening = isListening;
        });
        if (!isListening) {
          Future.delayed(const Duration(milliseconds: 1000), () {});
        }
      });
}
