import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/quiz_page.dart';
import '../buttons/loginbtn.dart';
// import '../buttons/quizbtn.dart';

class ExamDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        scrolledUnderElevation: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(10)),
              width: 400,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Rules : ",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "The quiz will consist of 40 questions.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Each question will have 4 answer choices.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Participants must select one answer choice per question.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Participants must answer at least 80% of the questions correctly to pass the quiz.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "If a participant fails to answer 80% of the questions correctly, they will be required to retake the video and quiz.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Participants may not use any external resources to answer the questions.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "The quiz covers Information Security topic.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "The scoring system will be based on the number of questions answered correctly out of the total number of questions.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "The total time to complete the quiz is 40 minutes and after that the quiz will be marked as completed and the result will be declared based on the response already submitted.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "*Note : ",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            "Please read rules carefully.",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 10,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
        child: ElevatedButton(
          style: loginbtn,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizPage(),
                ),
                (route) => false);
          },
          child: Text("Start Quiz"),
        ),
      ),
    );
  }
}
