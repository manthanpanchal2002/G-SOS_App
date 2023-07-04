import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
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
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "This digital world is what you make of it in the end.",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 15),
        ),
        pathImage: "assets/images/img_7.png",
        heightImage: 200,
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "No, just be Aware",
        styleTitle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "If it's smart, it's vulnerable.",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 15),
        ),
        pathImage: "assets/images/img_8.png",
        heightImage: 200,
        backgroundColor: Colors.white,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Be Aware with us",
        styleTitle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        description: "Your Ally in Digital Warfare!",
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(color: Color(0xFF8c8c8c), fontSize: 15),
        ),
        pathImage: "assets/images/img_9.png",
        heightImage: 200,
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: IntroSlider(
        key: UniqueKey(),
        listContentConfig: listContentConfig,
        renderDoneBtn: Text(
          "NEXT",
        ),
        onDonePress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LandingPage()),
          );
        },
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
      ),
    );
  }
}