import 'package:creativespace/responsive/web.dart';
import 'package:creativespace/responsive/responsive.dart';
import 'package:creativespace/responsive/mobile.dart';
import 'package:flutter/material.dart';

class splashWeb extends StatefulWidget {
  const splashWeb({Key? key}) : super(key: key);

  @override
  State<splashWeb> createState() => _splashWebState();
}

class _splashWebState extends State<splashWeb> {
  double boxheight = 0;
  double boxheight1 = 0;
  double boxheight2 = 0;
  double boxheight3 = 0;
  double boxheight4 = 0;
  double boxheight5 = 0;

  @override
  void initState() {
    super.initState();
    _changeheight();
  }

  void _changeheight() async {
    await Future.delayed(Duration(milliseconds: 400), () {});
    setState(() {
      boxheight = MediaQuery.of(context).size.height;
    });
    await Future.delayed(Duration(milliseconds: 300), () {});
    setState(() {
      boxheight1 = MediaQuery.of(context).size.height;
    });
    await Future.delayed(Duration(milliseconds: 200), () {});
    setState(() {
      boxheight2 = MediaQuery.of(context).size.height;
    });
    await Future.delayed(Duration(milliseconds: 150), () {});
    setState(() {
      boxheight3 = MediaQuery.of(context).size.height;
    });
    await Future.delayed(Duration(milliseconds: 500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const responsiveLayout(
                webScreenLayout: webScreenLayout(),
                mobileScreenLayout: mobileScreenLayout())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: boxheight,
              decoration: BoxDecoration(color: Colors.lightGreenAccent),
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: boxheight1,
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: boxheight2,
              decoration: BoxDecoration(color: Colors.pinkAccent),
            ),
          ),
          Positioned(
            top: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: MediaQuery.of(context).size.width,
              height: boxheight3,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2)),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Icon(
                      Icons.circle_rounded,
                      color: Colors.white.withOpacity(1),
                    ),
                  ),
                ),
                Text(
                  '  Creative',
                  style: TextStyle(
                      fontFamily: 'dancing',
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                Text(
                  ' Space',
                  style: TextStyle(
                      fontFamily: 'Serif',
                      fontSize: 28,
                      fontWeight: FontWeight.w200),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
