import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parth2/Eliminate.dart';
import 'package:parth2/speech.dart';

class HomePage extends StatefulWidget {
  String word;

  HomePage(this.word);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textSample = 'Tap to Speak !';
  bool isListening = false;
  String Resulttext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1c202b),
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
        body: Stack(children: [
          SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100),
                child: Text(
                  textSample,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 1.15),
                InkWell(
                  onTap: () {
                    Result();

                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            color: const Color(0xff1c202b),
                            height: MediaQuery.of(context).size.height / 2,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white10),
                                    child: Center(
                                      child: Text(
                                        Resulttext,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.alata(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .bottomToTop,
                                              child: Home1()));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              8,
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white10),
                                      child: Center(
                                        child: Text(
                                          "Repeat",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.alata(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10),
                      child: Center(
                        child: Text(
                          "Analyze",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
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

  Future Result() async {
    var str = textSample;
    var other = "${widget.word}";
    if (str.contains(other)) {
      Resulttext = "Your Speech contains the Wrong word";
    } else {
      Resulttext = "Going good Your Speech not contains the Wrong word";
    }
  }
}
