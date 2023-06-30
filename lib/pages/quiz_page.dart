import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Routes/routes.dart';
import '../buttons/loginbtn.dart';
import '../data/QuestionsForQuiz.dart';
import '../data/UserQuizData.dart';
import 'assign_quiz_page.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "${title_name} Quiz",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17,
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

// body
class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

List<QuestionsForQuiz> questions_for_quiz = [];

String? quizCard1_user_choice;
String? quizCard2_user_choice;
String? quizCard3_user_choice;
String? quizCard4_user_choice;
String? quizCard5_user_choice;

class _BodyState extends State<Body> {
  final countdownDuration = Duration(seconds: dur * 60);
  // final countdownDuration = Duration(seconds: 10);
  Duration duration = Duration();
  Timer? timer;
  bool isCountDown = true;

  int quizCard1_selectedOption = 0;
  int quizCard2_selectedOption = 0;
  int quizCard3_selectedOption = 0;
  int quizCard4_selectedOption = 0;
  int quizCard5_selectedOption = 0;

  bool quizCard1_flag = false;
  bool quizCard2_flag = false;
  bool quizCard3_flag = false;
  bool quizCard4_flag = false;
  bool quizCard5_flag = false;

  String? userAns;
  // @override
  // void initState() {
  //   selectedOption = 0;
  // }

  void reset() {
    if (isCountDown) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void initState() {
    super.initState();
    startTimer();
    reset();
    quizCard1_selectedOption = 0;
    quizCard2_selectedOption = 0;
    quizCard3_selectedOption = 0;
    quizCard4_selectedOption = 0;
    quizCard5_selectedOption = 0;
  }

  QuizCard1_setSelectedOption(int val) {
    setState(() {
      quizCard1_selectedOption = val;
    });
  }

  QuizCard2_setSelectedOption(int val) {
    setState(() {
      quizCard2_selectedOption = val;
    });
  }

  QuizCard3_setSelectedOption(int val) {
    setState(() {
      quizCard3_selectedOption = val;
    });
  }

  QuizCard4_setSelectedOption(int val) {
    setState(() {
      quizCard4_selectedOption = val;
    });
  }

  QuizCard5_setSelectedOption(int val) {
    setState(() {
      quizCard5_selectedOption = val;
    });
  }

  void addTime() {
    // final addSeconds = 1;
    final addSeconds = isCountDown ? -1 : 1;

    setState(
      () {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds < 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
          getUserDataForScore();
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "Oop's time out",
            fontSize: 13,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );
          print("Quiz ended");
          timer?.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      },
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      addTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    // QuestionController _questionController = Get.put(QuestionController());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CountDown(hour: hour, minutes: minutes, seconds: seconds),
            SizedBox(height: 40),
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // startTimer();
                  // reset();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            // ----------------- Quiz Card 1 -----------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Q1. ${questions_for_quiz[0].questions}",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: Radio(
                                                value: 1,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard1_selectedOption,
                                                onChanged: (val) {
                                                  quizCard1_flag = true;
                                                  print(questions_for_quiz[0]
                                                      .option1);
                                                  quizCard1_user_choice =
                                                      questions_for_quiz[0]
                                                          .option1;
                                                  print(val);
                                                  QuizCard1_setSelectedOption(
                                                      val!);
                                                  if (questions_for_quiz[0]
                                                          .option1 ==
                                                      questions_for_quiz[0]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[0].option1}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 2,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard1_selectedOption,
                                                onChanged: (val) {
                                                  quizCard1_flag = true;
                                                  print(questions_for_quiz[0]
                                                      .option2);
                                                  quizCard1_user_choice =
                                                      questions_for_quiz[0]
                                                          .option2;
                                                  print(val);
                                                  QuizCard1_setSelectedOption(
                                                      val!);
                                                  if (questions_for_quiz[0]
                                                          .option2 ==
                                                      questions_for_quiz[0]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[0].option2}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 3,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard1_selectedOption,
                                                onChanged: (val) {
                                                  quizCard1_flag = true;
                                                  print(questions_for_quiz[0]
                                                      .option3);
                                                  quizCard1_user_choice =
                                                      questions_for_quiz[0]
                                                          .option3;
                                                  print(val);
                                                  QuizCard1_setSelectedOption(
                                                      val!);
                                                  if (questions_for_quiz[0]
                                                          .option3 ==
                                                      questions_for_quiz[0]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[0].option3}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 4,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard1_selectedOption,
                                                onChanged: (val) {
                                                  quizCard1_flag = true;
                                                  print(questions_for_quiz[0]
                                                      .option4);
                                                  quizCard1_user_choice =
                                                      questions_for_quiz[0]
                                                          .option4;
                                                  print(val);
                                                  QuizCard1_setSelectedOption(
                                                      val!);
                                                  if (questions_for_quiz[0]
                                                          .option4 ==
                                                      questions_for_quiz[0]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[0].option4}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ----------- Quiz Card 2 -------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Q2. ${questions_for_quiz[1].questions}",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: Radio(
                                                value: 1,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard2_selectedOption,
                                                onChanged: (val) {
                                                  quizCard2_flag = true;
                                                  print(val);
                                                  print(questions_for_quiz[1]
                                                      .option1);
                                                  quizCard2_user_choice =
                                                      questions_for_quiz[1]
                                                          .option1;
                                                  QuizCard2_setSelectedOption(
                                                      val!);
                                                  if (questions_for_quiz[1]
                                                          .option1 ==
                                                      questions_for_quiz[1]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[1].option1}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 2,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard2_selectedOption,
                                                onChanged: (val) {
                                                  quizCard2_flag = true;
                                                  print(val);
                                                  QuizCard2_setSelectedOption(
                                                      val!);
                                                  print(questions_for_quiz[1]
                                                      .option2);
                                                  quizCard2_user_choice =
                                                      questions_for_quiz[1]
                                                          .option2;
                                                  if (questions_for_quiz[1]
                                                          .option2 ==
                                                      questions_for_quiz[1]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[1].option2}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 3,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard2_selectedOption,
                                                onChanged: (val) {
                                                  quizCard2_flag = true;
                                                  print(val);
                                                  QuizCard2_setSelectedOption(
                                                      val!);
                                                  print(questions_for_quiz[1]
                                                      .option3);
                                                  quizCard2_user_choice =
                                                      questions_for_quiz[1]
                                                          .option3;
                                                  if (questions_for_quiz[1]
                                                          .option3 ==
                                                      questions_for_quiz[1]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[1].option3}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 4,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard2_selectedOption,
                                                onChanged: (val) {
                                                  quizCard2_flag = true;
                                                  print(val);
                                                  QuizCard2_setSelectedOption(
                                                      val!);
                                                  quizCard2_user_choice =
                                                      questions_for_quiz[1]
                                                          .option4;
                                                  print(questions_for_quiz[1]
                                                      .option4);
                                                  if (questions_for_quiz[0]
                                                          .option4 ==
                                                      questions_for_quiz[0]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[1].option4}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ----------- Quiz Card 3 -------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Q3. ${questions_for_quiz[2].questions}",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: Radio(
                                                value: 1,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard3_selectedOption,
                                                onChanged: (val) {
                                                  quizCard3_flag = true;
                                                  print(val);
                                                  QuizCard3_setSelectedOption(
                                                      val!);
                                                  quizCard3_user_choice =
                                                      questions_for_quiz[2]
                                                          .option1;
                                                  print(questions_for_quiz[2]
                                                      .option1);
                                                  if (questions_for_quiz[2]
                                                          .option1 ==
                                                      questions_for_quiz[2]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[2].option1}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 2,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard3_selectedOption,
                                                onChanged: (val) {
                                                  quizCard3_flag = true;
                                                  print(val);
                                                  QuizCard3_setSelectedOption(
                                                      val!);
                                                  quizCard3_user_choice =
                                                      questions_for_quiz[2]
                                                          .option2;
                                                  print(questions_for_quiz[2]
                                                      .option2);
                                                  if (questions_for_quiz[2]
                                                          .option2 ==
                                                      questions_for_quiz[2]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[2].option2}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 3,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard3_selectedOption,
                                                onChanged: (val) {
                                                  quizCard3_flag = true;
                                                  print(val);
                                                  QuizCard3_setSelectedOption(
                                                      val!);
                                                  quizCard3_user_choice =
                                                      questions_for_quiz[2]
                                                          .option3;
                                                  print(questions_for_quiz[2]
                                                      .option3);
                                                  if (questions_for_quiz[2]
                                                          .option3 ==
                                                      questions_for_quiz[2]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[2].option3}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 4,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard3_selectedOption,
                                                onChanged: (val) {
                                                  quizCard3_flag = true;
                                                  print(val);
                                                  quizCard3_user_choice =
                                                      questions_for_quiz[2]
                                                          .option4;
                                                  QuizCard3_setSelectedOption(
                                                      val!);
                                                  print(questions_for_quiz[2]
                                                      .option4);
                                                  if (questions_for_quiz[2]
                                                          .option4 ==
                                                      questions_for_quiz[2]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[2].option4}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ----------- Quiz Card 4 -------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                              "Q4. ${questions_for_quiz[3].questions}",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: Radio(
                                                value: 1,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard4_selectedOption,
                                                onChanged: (val) {
                                                  quizCard4_flag = true;
                                                  print(val);
                                                  QuizCard4_setSelectedOption(
                                                      val!);
                                                  quizCard4_user_choice =
                                                      questions_for_quiz[3]
                                                          .option1;
                                                  print(questions_for_quiz[3]
                                                      .option1);
                                                  if (questions_for_quiz[3]
                                                          .option1 ==
                                                      questions_for_quiz[3]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[3].option1}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 2,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard4_selectedOption,
                                                onChanged: (val) {
                                                  quizCard4_flag = true;
                                                  print(val);
                                                  QuizCard4_setSelectedOption(
                                                      val!);
                                                  quizCard4_user_choice =
                                                      questions_for_quiz[3]
                                                          .option2;
                                                  print(questions_for_quiz[3]
                                                      .option2);
                                                  if (questions_for_quiz[3]
                                                          .option2 ==
                                                      questions_for_quiz[3]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[3].option2}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 3,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard4_selectedOption,
                                                onChanged: (val) {
                                                  quizCard4_flag = true;
                                                  print(val);
                                                  QuizCard4_setSelectedOption(
                                                      val!);
                                                  quizCard4_user_choice =
                                                      questions_for_quiz[3]
                                                          .option3;
                                                  print(questions_for_quiz[3]
                                                      .option3);
                                                  if (questions_for_quiz[3]
                                                          .option3 ==
                                                      questions_for_quiz[3]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[3].option3}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 4,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard4_selectedOption,
                                                onChanged: (val) {
                                                  quizCard4_flag = true;
                                                  print(val);
                                                  QuizCard4_setSelectedOption(
                                                      val!);
                                                  quizCard4_user_choice =
                                                      questions_for_quiz[3]
                                                          .option4;
                                                  print(questions_for_quiz[3]
                                                      .option4);
                                                  if (questions_for_quiz[3]
                                                          .option4 ==
                                                      questions_for_quiz[3]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[3].option4}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ----------- Quiz Card 5 -------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Q5. ${questions_for_quiz[4].questions}",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            ListTile(
                                              leading: Radio(
                                                value: 1,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard5_selectedOption,
                                                onChanged: (val) {
                                                  quizCard5_flag = true;
                                                  print(val);
                                                  QuizCard5_setSelectedOption(
                                                      val!);
                                                  quizCard5_user_choice =
                                                      questions_for_quiz[4]
                                                          .option1;
                                                  print(questions_for_quiz[4]
                                                      .option1);
                                                  if (questions_for_quiz[4]
                                                          .option1 ==
                                                      questions_for_quiz[4]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[4].option1}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 2,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard5_selectedOption,
                                                onChanged: (val) {
                                                  quizCard5_flag = true;
                                                  print(val);
                                                  QuizCard5_setSelectedOption(
                                                      val!);
                                                  quizCard5_user_choice =
                                                      questions_for_quiz[4]
                                                          .option2;
                                                  print(questions_for_quiz[4]
                                                      .option2);
                                                  if (questions_for_quiz[4]
                                                          .option2 ==
                                                      questions_for_quiz[4]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[4].option2}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 3,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard5_selectedOption,
                                                onChanged: (val) {
                                                  quizCard5_flag = true;
                                                  print(val);
                                                  QuizCard5_setSelectedOption(
                                                      val!);
                                                  quizCard5_user_choice =
                                                      questions_for_quiz[4]
                                                          .option3;
                                                  print(questions_for_quiz[4]
                                                      .option3);
                                                  if (questions_for_quiz[4]
                                                          .option3 ==
                                                      questions_for_quiz[4]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[4].option3}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Radio(
                                                value: 4,
                                                activeColor:
                                                    Color(0xffff6b9080),
                                                groupValue:
                                                    quizCard5_selectedOption,
                                                onChanged: (val) {
                                                  quizCard5_flag = true;
                                                  print(val);
                                                  QuizCard5_setSelectedOption(
                                                      val!);
                                                  quizCard5_user_choice =
                                                      questions_for_quiz[4]
                                                          .option4;
                                                  print(questions_for_quiz[4]
                                                      .option4);
                                                  if (questions_for_quiz[4]
                                                          .option4 ==
                                                      questions_for_quiz[4]
                                                          .answer) {
                                                    print("Correct Answer");
                                                  }
                                                },
                                              ),
                                              title: Text(
                                                "${questions_for_quiz[4].option4}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
          child: ElevatedButton(
            style: loginbtn,
            onPressed: () {
              if (quizCard1_flag == true &&
                  quizCard2_flag == true &&
                  quizCard3_flag == true &&
                  quizCard4_flag == true &&
                  quizCard5_flag == true) {
                getUserDataForScore();
                timer?.cancel();
                print("Quiz submitted");

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );

                Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                  msg: "Quiz submitted",
                  fontSize: 13,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  gravity: ToastGravity.TOP,
                );
              } else {
                Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                  msg: "Please attempt all questions",
                  fontSize: 13,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  gravity: ToastGravity.TOP,
                );
                print("Please attempt all questions");
              }
            },
            child: Text("Submit"),
          ),
        ),
      ),
    );
  }

  Future<List<QuestionsForQuiz>> getData() async {
    final response = await http
        .get(Uri.parse("${ipAddress}api.php?entity=quiz&cat_id=$subj_id"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        questions_for_quiz.add(QuestionsForQuiz.fromJson(index));
      }
      return questions_for_quiz;
    } else {
      return questions_for_quiz;
    }
  }
}

class CountDown extends StatelessWidget {
  const CountDown({
    super.key,
    required this.hour,
    required this.minutes,
    required this.seconds,
  });

  final String hour;
  final String minutes;
  final String seconds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // progressBar(),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("|"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '$hour hr : $minutes min : $seconds sec',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
