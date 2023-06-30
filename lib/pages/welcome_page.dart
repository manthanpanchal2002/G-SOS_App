import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'one_time_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Image.asset(
                  "assets/images/logo.png",
                  height: 85,
                )),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: [
            Spacer(),
            Container(
              child: Text(
                "Powered By\t",
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(fontSize: 8),
                ),
              ),
            ),
            Image.asset(
              "assets/images/img_2.png",
              height: 14,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OneTimePage()));
  }
}
