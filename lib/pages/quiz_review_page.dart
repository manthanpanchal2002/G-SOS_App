import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_app/pages/landing_page.dart';
import 'package:my_app/pages/question_controller.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Routes/routes.dart';
import '../data/QuizReviewDetails.dart';
import 'package:http/http.dart' as http;
import 'completed_quiz_page.dart';

class QuizReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          "$completed_quiz_title",
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

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<QuizReviewDetails> quiz_review_page = [];
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    Map<String, double> dataMap = {
      "Correct Answers": correct_ans!.toDouble(),
      "Wrong Answers": wrong_ans!.toDouble(),
    };
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GraphicalData(
              dataMap: dataMap, questionController: _questionController),
          // SizedBox(height: 40),
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                                          "Q1. ${quiz_review_page[0].question}",
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
                                            // leading: Text("A. "),
                                            title: Text(
                                              "A)\t\t${quiz_review_page[0].option1}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            // leading: Text("B."),
                                            title: Text(
                                              "B)\t\t${quiz_review_page[0].option2}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "C)\t\t${quiz_review_page[0].option3}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "D)\t\t${quiz_review_page[0].option4}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Correct Ans. : ${quiz_review_page[0].correctAnswer}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
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
                                          "Q2. ${quiz_review_page[1].question}",
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
                                            title: Text(
                                              "A)\t\t${quiz_review_page[1].option1}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "B)\t\t${quiz_review_page[1].option2}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "C)\t\t${quiz_review_page[1].option3}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "D)\t\t${quiz_review_page[1].option4}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Correct Ans. : ${quiz_review_page[1].correctAnswer}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
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
                                          "Q3. ${quiz_review_page[2].question}",
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
                                            title: Text(
                                              "A)\t\t${quiz_review_page[2].option1}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "B)\t\t${quiz_review_page[2].option2}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "C)\t\t${quiz_review_page[2].option3}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "D)\t\t${quiz_review_page[2].option4}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Correct Ans. : ${quiz_review_page[2].correctAnswer}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
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
                                            "Q4. ${quiz_review_page[3].question}",
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
                                            title: Text(
                                              "A)\t\t${quiz_review_page[3].option1}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "B)\t\t${quiz_review_page[3].option2}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "C)\t\t${quiz_review_page[3].option3}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "D)\t\t${quiz_review_page[3].option4}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Correct Ans. : ${quiz_review_page[3].correctAnswer}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
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
                                          "Q5. ${quiz_review_page[4].question}",
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
                                            title: Text(
                                              "A)\t\t${quiz_review_page[4].option1}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "B)\t\t${quiz_review_page[4].option2}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "C)\t\t${quiz_review_page[4].option3}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "D)\t\t${quiz_review_page[4].option4}",
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          Text(
                                            "Correct Ans. : ${quiz_review_page[4].correctAnswer}",
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 13,
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
    );
  }

  Future<List<QuizReviewDetails>> getData() async {
    final response = await http.get(Uri.parse(
        "${ipAddress}api.php?entity=detailedresult&user_id=$user_id&subject_id=$completed_quiz_subID"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        quiz_review_page.add(QuizReviewDetails.fromJson(index));
      }
      return quiz_review_page;
    } else {
      return quiz_review_page;
    }
  }
}

class GraphicalData extends StatelessWidget {
  const GraphicalData({
    super.key,
    required this.dataMap,
    required QuestionController questionController,
  });

  final Map<String, double> dataMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        // decoration: BoxDecoration(
                        //     color: Color(0xFFf2f2f2),
                        //     borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "Attempted on : ${DateFormat.yMMMMd().format(completed_quiz_date!)}",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF8c8c8c),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              PieChart(
                                colorList: [
                                  Colors.green,
                                  Colors.red,
                                ],
                                dataMap: dataMap,
                                animationDuration: Duration(milliseconds: 1000),
                                chartLegendSpacing: 48,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 3.2,
                                // colorList: Colors.white,
                                initialAngleInDegree: 0,
                                chartType: ChartType.disc,
                                ringStrokeWidth: 10,
                                // centerText: "HYBRID",
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.right,
                                  showLegends: true,
                                  // legendShape: _BoxShape.circle,
                                  legendTextStyle: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  chartValueStyle: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  showChartValueBackground: false,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
