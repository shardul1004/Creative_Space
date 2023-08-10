import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../presentaion/my_flutter_app_icons.dart';

class mobileScreenLayout extends StatefulWidget {
  const mobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<mobileScreenLayout> createState() => _mobileScreenLayoutState();
}

double boxwidth = 0;
double boxwidth1 = 0;
double boxwidth2 = 0;
double boxwidth3 = 0;
double boxwidth4 = 80;
double rateZero = 600;
double rateOne = 140;
double project = 380;
double project2 = 350;
double project3 = 380;
double turn = 0;
double shardul1 = 280;
double shardul = 200 + 175;
double eyecos = 340 + 175;

class _mobileScreenLayoutState extends State<mobileScreenLayout>
    with TickerProviderStateMixin {
  bool background = true;
  late ScrollController _scrollController;
  Color appbarcol = Colors.white;
  Color iconcol = Colors.black;
  late AnimationController _backgroundanic;
  late Animation<Color?> _backgroundAni;
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _animationController;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late AnimationController colorani;
  late Animation colorAni;
  final _listOfTweens = [
    ColorTween(begin: Colors.pinkAccent, end: Colors.lightBlueAccent),
    ColorTween(begin: Colors.lightGreenAccent, end: Colors.white),
    ColorTween(begin: Colors.redAccent, end: Colors.yellowAccent),
  ];

  ColorTween tween() =>
      _listOfTweens[Random().nextInt(_listOfTweens.length - 1)];

  void saferside() {
    setState(() {
      _backgroundanic.reverse();
      background = true;
      iconcol = Colors.black;
      appbarcol = Colors.white;
    });
  }

  void saferside1() {
    setState(() {
      _backgroundanic.forward();
      background = false;
      iconcol = Colors.white;
      appbarcol = Colors.black;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _backgroundanic = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _backgroundAni =
        ColorTween(begin: Color(0xff1a1a1a), end: Color(0xffeeeae7))
            .animate(_backgroundanic);
    colorani =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    colorAni = tween()
        .chain(CurveTween(curve: Curves.easeInOutCubic))
        .animate(colorani);
    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50000));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animationController.forward();
    _controller.repeat();
    colorani.repeat();
    setState(() {
      boxwidth = 0;

      _controller2.repeat();
    });
    changewidthofbox();
  }

  void changewidthofbox() async {
    await Future.delayed(const Duration(milliseconds: 80));
    setState(() {
      boxwidth = 350;
    });
  }

  void dispose() {
    _backgroundanic.dispose();
    _scrollController.dispose();
    colorani.dispose();
    _controller.dispose();
    _animationController.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _backgroundAni.value,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: appbarcol, borderRadius: BorderRadius.circular(2)),
              child: Icon(
                Icons.circle_rounded,
                color: iconcol,
              ),
            ),
            Text(
              '  Creative',
              style: TextStyle(
                fontFamily: 'dancing',
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: appbarcol,
              ),
            ),
            Text(
              ' Space',
              style: TextStyle(
                fontFamily: 'Serif',
                fontSize: 24,
                fontWeight: FontWeight.w200,
                color: appbarcol,
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 0.5, color: appbarcol),
              ),
              child: Icon(
                Icons.menu,
                color: appbarcol,
              ),
            ),
          )
        ],
      ),
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification && v.metrics.pixels > 3780) {
            setState(() {
              boxwidth4 = MediaQuery.of(context).size.width - 50;
              _controller4.forward();
            });
          }
          if (v is ScrollUpdateNotification &&
              v.metrics.pixels > 2815 &&
              background == true) {
            setState(() {
              _backgroundanic.forward();
              background = false;
              appbarcol = Colors.black;
              iconcol = Colors.white;
            });
          }
          if (v is ScrollUpdateNotification &&
              v.metrics.pixels < 2815 &&
              background == false) {
            setState(() {
              _backgroundanic.reverse();
              background = true;
              iconcol = Colors.black;
              appbarcol = Colors.white;
            });
          }
          if (v is ScrollUpdateNotification) {
            setState(() {
              turn += (v.scrollDelta!);
              rateOne -= (v.scrollDelta! / 1.5);
              rateZero -= (v.scrollDelta! * 2)!;
            });
          }
          if (v is ScrollUpdateNotification &&
              v.metrics.pixels > 520 &&
              project > 200) {
            setState(() {
              project -= (v.scrollDelta!);
            });
          }
          if (v is ScrollUpdateNotification &&
              v.metrics.pixels > 991 &&
              project2 > 250) {
            setState(() {
              project2 -= (v.scrollDelta!);
            });
          }
          if (v is ScrollUpdateNotification &&
              v.metrics.pixels > 1527 &&
              project3 > 200) {
            setState(() {
              project3 -= (v.scrollDelta!);
            });
          }
          if (v is ScrollUpdateNotification && v.metrics.pixels > 2010) {
            setState(() {
              shardul -= (v.scrollDelta! * 0.5);
              eyecos -= (v.scrollDelta! * 0.5);
              shardul1 -= (v.scrollDelta! * 0.25);
            });
          }
          if (v is ScrollUpdateNotification && v.metrics.pixels > 2185) {
            setState(() {
              _controller3.forward();
            });
          }
          if (v is ScrollUpdateNotification && v.metrics.pixels > 3425) {
            setState(() {
              boxwidth1 = 600;
              boxwidth2 = 400;
              boxwidth3 = 200;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              // first half
              Container(
                height: 620,
                decoration: const BoxDecoration(),
                child: Stack(children: [
                  //gif

                  Positioned(
                    left: 10,
                    top: rateOne,
                    child: Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/images/video.gif'),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 310.0,
                              left: MediaQuery.of(context).size.width - 200),
                          child: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(_controller),
                            child: CircularText(
                              radius: 83,
                              children: [
                                TextItem(
                                    text: const Text(
                                      'R e a l l y',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                    direction: CircularTextDirection.clockwise,
                                    startAngle: 180),
                                TextItem(
                                    text: const Text(
                                      'G o o d',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                    direction: CircularTextDirection.clockwise,
                                    startAngle: -40),
                                TextItem(
                                  text: const Text(
                                    'V i d e o',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16),
                                  ),
                                  direction: CircularTextDirection.clockwise,
                                  startAngle: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),

                  //text on image

                  Positioned(
                    top: 40,
                    left: 30,
                    right: 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(0, -0.2),
                                    end: Offset.zero)
                                .animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: const Text(
                                'TURN IDEAS INTO',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 48,
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(0, -0.2),
                                    end: Offset.zero)
                                .animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: const Text(
                                'REALITY',
                                style: TextStyle(
                                  fontFamily: 'dancing',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 48,
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 650),
                            width: boxwidth,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //scroll----

                  // Positioned(
                  //   top: rateZero,
                  //   right: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 100, right: 10),
                  //     child: Transform.rotate(
                  //       angle: -pi / 2,
                  //       child: Container(
                  //         height: 16,
                  //         width: 200,
                  //         child: const Text(
                  //           'SCROLL -----------------------------',
                  //           style: TextStyle(
                  //               letterSpacing: 0,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w800,
                  //               fontSize: 16),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
              ),

              // text about me
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: Text(
                        'A talented individual invites you to explore their portfolio website,',
                        style: TextStyle(
                            fontFamily: 'Serif',
                            color: Color(0xff7f7f7f),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22.0),
                      child: RotationTransition(
                        turns:
                            Tween(begin: 0.0, end: 1.0).animate(_controller2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(2)),
                          child: const Icon(
                            Icons.circle_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                            text: 'Creative',
                            style: TextStyle(
                                fontFamily: 'dancing',
                                color: Color(0xff7f7f7f),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text:
                                    ' Space. This platform showcases their skills, projects, and experiences ',
                                style: TextStyle(
                                    fontFamily: 'Serif',
                                    color: Color(0xff7f7f7f),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: Text(
                        'captivating and easy-to-follow manner. Get an in-depth look at their passion for innovation.',
                        style: TextStyle(
                            fontFamily: 'Serif',
                            color: Color(0xff7f7f7f),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              // My creation
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  '"CREATION"',
                  style: TextStyle(
                      fontFamily: 'Serif',
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/metaverse.png'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: project,
                        child: Container(
                          height: 300,
                          width: (MediaQuery.of(context).size.width - 35),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 4.0,
                                sigmaY: 4.0,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 35,
                                height: 300,
                                color: Colors.white.withOpacity(0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Maya (Metaverse)',
                                      style: TextStyle(
                                        fontFamily: 'dancing',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff4b4b4b),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          'Celebrates the traditional art and heritage of India in meta-verse MAYA, featuring a variety of monuments and artworks for users to explore. Users can purchase traditional art pieces as NFTs using the cryptocurrency Maya, enabling a secure and decentralized marketplace for Indian art.',
                                          style: TextStyle(
                                              fontFamily: 'Serif',
                                              color: Color(0xff4b4b4b),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: AssetImage('assets/images/pac.png'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: project2,
                        child: Container(
                          height: 300,
                          width: (MediaQuery.of(context).size.width - 35),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 4.0,
                                sigmaY: 4.0,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 35,
                                height: 300,
                                color: Colors.white.withOpacity(0),
                                child: Column(
                                  children: [
                                    Text(
                                      'AI powered Pac-Man',
                                      style: TextStyle(
                                        fontFamily: 'dancing',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          'In the world of code and wires,\nA game of ghosts and a yellow sphere transpires,\nWith Python as the language to inspire,\nArtificial intelligence brings the enemies to life, never to tire.',
                                          style: TextStyle(
                                              fontFamily: 'Serif',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 450,
                  width: (MediaQuery.of(context).size.width - 40),
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: (MediaQuery.of(context).size.width - 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: AssetImage('assets/images/block.gif'),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        top: project3,
                        child: Container(
                          height: 300,
                          width: (MediaQuery.of(context).size.width - 45),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 4.0,
                                sigmaY: 4.0,
                              ),
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 45),
                                height: 300,
                                color: Colors.white.withOpacity(0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Streamlining Supply Chain Processes with Blockchain and Machine Learning',
                                      style: TextStyle(
                                        fontFamily: 'dancing',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          'A blockchain-based platform with integrated machine learning algorithms that aim to streamline supply chain management and improve transparency, efficiency, and security in various industries.',
                                          style: TextStyle(
                                              fontFamily: 'Serif',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: (MediaQuery.of(context).size.width * 1.414) + 30,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      left: 40,
                      child: Stack(
                        children: [
                          Transform.rotate(
                            angle: (turn / (180 * 10)) * pi,
                            child: Container(
                              height: MediaQuery.of(context).size.width - 80,
                              width: MediaQuery.of(context).size.width - 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160 +
                          ((MediaQuery.of(context).size.width - 200) / 2) -
                          ((MediaQuery.of(context).size.width - 200) / 2),
                      left: ((MediaQuery.of(context).size.width) -
                              (MediaQuery.of(context).size.width - 200)) /
                          2,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        height: MediaQuery.of(context).size.width - 200,
                        constraints: BoxConstraints(minHeight: 1, minWidth: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Positioned(
                      top: shardul,
                      left: 80,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.2,
                        height: MediaQuery.of(context).size.width / 3.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/shardul.jpg')),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Positioned(
                      top: eyecos +
                          ((MediaQuery.of(context).size.width - 200) / 2) -
                          (MediaQuery.of(context).size.width / 8),
                      right: 100,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffd8e4f2),
                            image: DecorationImage(
                                image: AssetImage('assets/images/eye.png'),
                                fit: BoxFit.fitHeight)),
                      ),
                    ),
                    Positioned(
                      top: shardul1 -
                          65 +
                          MediaQuery.of(context).size.width / 4 +
                          ((MediaQuery.of(context).size.width - 200) / 2) -
                          (MediaQuery.of(context).size.width / 8),
                      left: 80,
                      child: Container(
                        child: Column(
                          children: [
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0, -0.2),
                                      end: Offset.zero)
                                  .animate(_controller3),
                              child: FadeTransition(
                                opacity: _controller3,
                                child: Text(
                                  'FEELING.',
                                  style: TextStyle(
                                    fontFamily: 'outline',
                                    color: Colors.white,
                                    fontSize: (94 *
                                            MediaQuery.of(context).size.width) /
                                        1200,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0, -0.2),
                                      end: Offset.zero)
                                  .animate(_controller3),
                              child: FadeTransition(
                                opacity: _controller3,
                                child: Text(
                                  'THINKING.',
                                  style: TextStyle(
                                    fontFamily: 'outline',
                                    color: Colors.white,
                                    fontSize: (94 *
                                            MediaQuery.of(context).size.width) /
                                        1200,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0, -0.2),
                                      end: Offset.zero)
                                  .animate(_controller3),
                              child: FadeTransition(
                                opacity: _controller3,
                                child: Text(
                                  'VIBING.',
                                  style: TextStyle(
                                    fontFamily: 'outline',
                                    color: Colors.white,
                                    fontSize: (94 *
                                            MediaQuery.of(context).size.width) /
                                        1200,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 50,
                      child: Container(
                        height: MediaQuery.of(context).size.width / 8,
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: colorAni.value,
                        ),
                        child: Icon(
                          Icons.circle_rounded,
                          color: Colors.black,
                          size: (MediaQuery.of(context).size.width / 8) - 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                            text: 'What I ',
                            style: TextStyle(
                                fontFamily: 'Serif',
                                color: Colors.black,
                                fontSize: 48,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: ' Excel ',
                                style: TextStyle(
                                    fontFamily: 'dancing',
                                    color: Colors.black,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'at',
                                style: TextStyle(
                                    fontFamily: 'Serif',
                                    color: Colors.black,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w500),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  height: 330,
                  width: (MediaQuery.of(context).size.width) - 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Text(
                          'Frontend Development',
                          style: TextStyle(
                            fontFamily: 'Serif',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Flutter',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 90,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Unity',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'HTML',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 90,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'CSS',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Cross-Platform',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 40,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'UI/UX',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 330,
                  width: (MediaQuery.of(context).size.width) - 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Text(
                          'Backend Development',
                          style: TextStyle(
                            fontFamily: 'Serif',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Python',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 90,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Firebase',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Flask',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 90,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Solidity',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'C#',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 40,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'AI/ML',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 330,
                  width: (MediaQuery.of(context).size.width) - 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 100),
                        child: Text(
                          'Android Development',
                          style: TextStyle(
                            fontFamily: 'Serif',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Java',
                              style: TextStyle(
                                fontFamily: 'Serif',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                          Flexible(
                              child: SizedBox(
                            width: 90,
                          )),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Dart',
                                style: TextStyle(
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 650),
                  width: boxwidth4,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(0, -0.2), end: Offset.zero)
                      .animate(_controller4),
                  child: FadeTransition(
                    opacity: _controller4,
                    child: Text(
                      'Lets Create Something\nAmazing Together!!!!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        fontFamily: 'dancing',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0, left: 8),
                        child: GestureDetector(
                          onTap: () {
                            saferside();
                            double start = 0;
                            _scrollController.jumpTo(start);
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Text(
                                  'Back to Top  ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Serif',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  Icons.arrow_circle_up_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.0, left: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  const url =
                                      'https://www.instagram.com/shardul1042/';
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                },
                                child: Icon(
                                  MyFlutterApp.instagram,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  const url =
                                      'https://www.linkedin.com/in/shardul-pund-b13506207/';
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                },
                                child: Icon(
                                  MyFlutterApp.linkedin_squared,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  const url = 'https://github.com/shardul1004';
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $uri';
                                  }
                                },
                                child: Icon(
                                  MyFlutterApp.github,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
