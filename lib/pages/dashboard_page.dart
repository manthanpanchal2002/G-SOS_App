import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Routes/routes.dart';
import '../data/CompletedQuizDetails.dart';
import 'completed_quiz_page.dart';
import 'landing_page.dart';
import 'notification_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

// ignore: non_constant_identifier_names

class _DashboardPageState extends State<DashboardPage> {
  // ignore: non_constant_identifier_names
  List<CompletedQuizDetails> completed_quiz_details = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 3,
        shadowColor: Color(0xFFa4c3b2),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "hi, ",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                Text("$inputed_username",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                          color: Color(0xfff6b9080),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CompletedQuizPage()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeeee),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Recent Attempt",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/img_10.png",
                                            height: 100,
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Text(
                                                "Quiz : ${completed_quiz_details[0].subjectName}\n\nPercentage : ${completed_quiz_details[0].percentage}\n\nGrade : ${completed_quiz_details[0].grade}",
                                                style: GoogleFonts.montserrat(
                                                  textStyle:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 17),
                                      Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Get Review",
                                            style: GoogleFonts.montserrat(
                                              textStyle:
                                                  TextStyle(fontSize: 10),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Spacer(),
                                          Icon(
                                            CupertinoIcons.arrow_right,
                                            size: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          }),
    );
  }

  Future<List<CompletedQuizDetails>> getData() async {
    final response = await http
        .get(Uri.parse("${ipAddress}api.php?entity=result&user_id=$user_id"));

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
