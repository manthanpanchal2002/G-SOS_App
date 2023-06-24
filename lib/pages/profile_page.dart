import 'package:blurry/blurry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/landing_page.dart';
import 'package:my_app/pages/security_awareness_page.dart';
import 'package:my_app/pages/terms_and_condition_page.dart';
import 'about_us_page.dart';
import 'assign_quiz_page.dart';
import 'certificate_page.dart';
import 'completed_quiz_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Personal",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xfff6b9080),
            ),
          ),
        ),
        elevation: 0.0,
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Blurry.error(
        //         title: "Log out",
        //         description: "Are you sure you want to log out?",
        //         confirmButtonText: "Ok",
        //         onConfirmButtonPressed: () {
        //           Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //               builder: (_) => LandingPage(),
        //             ),
        //           );
        //         },
        //       ).show(context);
        //       print("Logout");
        //     },
        //     icon: const Icon(
        //       Icons.logout,
        //       color: Colors.black,
        //       size: 20,
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Body_for_Profile(),
          ),
        ),
      ),
    );
  }
}

class Body_for_Profile extends StatelessWidget {
  const Body_for_Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/user.png",
                height: 70,
                width: 70,
              ),
              SizedBox(width: 15),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$user_name",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Text(
                    "$user_email",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Blurry.error(
                    title: "Log out",
                    description: "Are you sure you want to log out?",
                    confirmButtonText: "Ok",
                    onConfirmButtonPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => LandingPage(),
                      //   ),
                      // );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LandingPage(),
                          ),
                          (route) => false);
                    },
                  ).show(context);
                  print("Logout");
                },
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 6.0, bottom: 6.0),
                        child: Text(
                          "Logout",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffa4c3b2)),
                          ),
                        ),
                      ),
                    ),
                    // Icon(
                    //   Icons.logout,
                    //   color: Colors.black,
                    //   size: 15,
                    // ),
                  ],
                ),
              ),
            ],
          ),

          Divider(),
          Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Quiz",
                    style: GoogleFonts.nunitoSans(
                      textStyle:
                          TextStyle(fontSize: 15, color: Color(0xFFcccccc)),
                    ),
                  ),
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompletedQuizPage()));
                },
                title: Text(
                  "Completed Quiz",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignQuizPage()));
                },
                title: Text(
                  "Assigned Quiz",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CertificatePage()));
                },
                title: Text(
                  "Certificate",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
          // SizedBox(height: 20),
          Divider(),
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Help",
                    style: GoogleFonts.nunitoSans(
                      textStyle:
                          TextStyle(fontSize: 15, color: Color(0xFFcccccc)),
                    ),
                  ),
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TermsAndConditionPage()));
                },
                title: Text(
                  "Terms and Conditions",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()));
                },
                title: Text(
                  "About us",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          // SizedBox(height: 20),
          Divider(),
          Column(
            children: [
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "More",
                    style: GoogleFonts.nunitoSans(
                      textStyle:
                          TextStyle(fontSize: 15, color: Color(0xFFcccccc)),
                    ),
                  ),
                ),
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecurityAwarenessPage()));
                },
                title: Text(
                  "Security Awareness",
                  style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFcccccc),
                  size: 20,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
