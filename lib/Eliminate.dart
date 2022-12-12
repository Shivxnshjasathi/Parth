import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parth2/home.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home1();
  }
}

class _Home1 extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter Word',
                        hintText: 'Enter Your Word'),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const HomePage()));
                  },
                  icon: Icon(Icons.done))
            ],
          ),
        ),
      ),
    );
  }
}
