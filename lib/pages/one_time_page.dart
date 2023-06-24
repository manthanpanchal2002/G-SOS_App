// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import '../buttons/loginbtn.dart';
import 'landing_page.dart';

class OneTimePage extends StatefulWidget {
  @override
  State<OneTimePage> createState() => _OneTimePageState();
}

class _OneTimePageState extends State<OneTimePage> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        title: "Is Digital World scary?",
        styleTitle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "This digital world is what you make of it in the end.",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 18),
        ),
        pathImage: "assets/images/img_7.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "No, just be Aware",
        styleTitle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "If it's smart, it's vulnerable.",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 18),
        ),
        pathImage: "assets/images/img_8.png",
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Be Aware with us",
        styleTitle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "Your Ally in Digital Warfare!",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 18),
        ),
        pathImage: "assets/images/img_9.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      renderDoneBtn: Text(
        "NEXT",
      ),
      onDonePress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => finalPage()),
        );
      },
      // onSkipPress: () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => finalPage()),
      // );
      // },
      isShowSkipBtn: false,
      doneButtonStyle: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
      prevButtonStyle: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
      nextButtonStyle: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
      ),
    );
  }
}

class finalPage extends StatelessWidget {
  const finalPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/images/logo_2.png",
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Welcome to G-SOS",
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              child: Text("Powered By\t",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(fontSize: 12),
                                  )),
                            ),
                            Image.asset(
                              "assets/images/img_2.png",
                              height: 18,
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Know your skills",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 28),
                                      )),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("by challenging youself",
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 28,
                                            color: Color(0xffff6b9080),
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
        child: ElevatedButton(
          style: loginbtn,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LandingPage()),
            );
          },
          child: Text("Let's Get Started"),
        ),
      ),
    );
  }
}
