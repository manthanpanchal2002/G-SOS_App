import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Routes/routes.dart';
import 'package:my_app/pages/quiz_review_page.dart';
import '../data/CompletedQuizDetails.dart';
import 'package:http/http.dart' as http;
import 'landing_page.dart';

String? completed_quiz_title;
int? correct_ans;
int? wrong_ans;
DateTime? completed_quiz_date;
int? completed_quiz_subID;

class CompletedQuizPage extends StatefulWidget {
  @override
  State<CompletedQuizPage> createState() => _CompletedQuizPageState();
}

class _CompletedQuizPageState extends State<CompletedQuizPage> {
  List<CompletedQuizDetails> completed_quiz_details = [];
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
        title: Text(
          "Completed Quiz",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17,
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        // scrolledUnderElevation: 3,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: completed_quiz_details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFeeeeee),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          // Image.asset("assets/images/img_4.png"),
                          // Divider(),
                          ListTile(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0, color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onTap: () {
                              completed_quiz_title =
                                  completed_quiz_details[index].subjectName;
                              correct_ans =
                                  completed_quiz_details[index].correctAnswer;
                              wrong_ans =
                                  completed_quiz_details[index].wrongAnswer;
                              completed_quiz_date =
                                  completed_quiz_details[index].date;
                              completed_quiz_subID =
                                  completed_quiz_details[index].subjectId;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizReviewPage()));
                            },
                            leading: Image.network(
                              "${completed_quiz_details[index].subjectImage}",
                              height: 18,
                            ),
                            title: Text(
                              "${completed_quiz_details[index].subjectName}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Score : ${completed_quiz_details[index].percentage}%",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 10),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Grade : ${completed_quiz_details[index].grade}",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              CupertinoIcons.forward,
                              color: Color(0xFFcccccc),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
      ),
    );
  }

  Future<List<CompletedQuizDetails>> getData() async {
    final response = await http.get(Uri.parse(
        "${ipAddress}api.php?entity=result&user_id=$user_id"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        completed_quiz_details.add(CompletedQuizDetails.fromJson(index));
      }
      return completed_quiz_details;
    } else {
      return completed_quiz_details;
    }
  }
}
