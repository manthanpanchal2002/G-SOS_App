import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/quiz_review_page.dart';
import 'package:http/http.dart' as http;
import '../data/PastQuizDetails.dart';
import 'landing_page.dart';
import 'notification_page.dart';
// import 'package:my_app/pages/profile_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

// ignore: non_constant_identifier_names
// int? user_id;
class _DashboardPageState extends State<DashboardPage> {
  // ignore: non_constant_identifier_names
  List<PastQuizDetails> past_quiz_details = [];

  // Widget horizontalList = Scaffold(
  //   body: FutureBuilder(
  //     future: getData(),
  //     builder: (context, snapshot) {},
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(vertical: 10.0),
  //       height: 200.0,
  //       child: ListView(
  //         scrollDirection: Axis.horizontal,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: Color(0xFFeeeeee),
  //                   borderRadius: BorderRadius.circular(10)),
  //               width: 250,
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Column(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Text(
  //                           "Recent Attempts",
  //                           style: TextStyle(
  //                               fontSize: 10, fontWeight: FontWeight.w700),
  //                         ),
  //                       ),
  //                       SizedBox(height: 20),
  //                       Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/images/img_10.png",
  //                             height: 80,
  //                           ),
  //                           Spacer(),
  //                           Column(
  //                             children: [
  //                               Text(
  //                                 "Duration : 60 MIN.\n\nQuiz :  xyz Quiz\n\nScore : 90",
  //                                 style: TextStyle(fontSize: 8),
  //                               ),
  //                             ],
  //                           ),
  //                           Spacer(),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: Color(0xFFeeeeee),
  //                   borderRadius: BorderRadius.circular(10)),
  //               width: 250,
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Column(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Text(
  //                           "Recent Attempts",
  //                           style: TextStyle(
  //                               fontSize: 10, fontWeight: FontWeight.w700),
  //                         ),
  //                       ),
  //                       SizedBox(height: 20),
  //                       Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/images/img_10.png",
  //                             height: 80,
  //                           ),
  //                           Spacer(),
  //                           Column(
  //                             children: [
  //                               Text(
  //                                 "Duration : 60 MIN.\n\nQuiz :  xyz Quiz\n\nScore : 90",
  //                                 style: TextStyle(fontSize: 8),
  //                               ),
  //                             ],
  //                           ),
  //                           Spacer(),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: Color(0xFFeeeeee),
  //                   borderRadius: BorderRadius.circular(10)),
  //               width: 250,
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Column(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Text(
  //                           "Recent Attempts",
  //                           style: TextStyle(
  //                               fontSize: 10, fontWeight: FontWeight.w700),
  //                         ),
  //                       ),
  //                       SizedBox(height: 20),
  //                       Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/images/img_10.png",
  //                             height: 80,
  //                           ),
  //                           Spacer(),
  //                           Column(
  //                             children: [
  //                               Text(
  //                                 "Duration : 60 MIN.\n\nQuiz :  xyz Quiz\n\nScore : 90",
  //                                 style: TextStyle(fontSize: 8),
  //                               ),
  //                             ],
  //                           ),
  //                           Spacer(),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   color: Color(0xFFeeeeee),
  //                   borderRadius: BorderRadius.circular(10)),
  //               width: 250,
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Column(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.topLeft,
  //                         child: Text(
  //                           "Recent Attempts",
  //                           style: TextStyle(
  //                               fontSize: 10, fontWeight: FontWeight.w700),
  //                         ),
  //                       ),
  //                       SizedBox(height: 20),
  //                       Row(
  //                         children: [
  //                           Image.asset(
  //                             "assets/images/img_10.png",
  //                             height: 80,
  //                           ),
  //                           Spacer(),
  //                           Column(
  //                             children: [
  //                               // Text(
  //                               //   "Attempt Date : DD/MM/YYYY\n\nDuration : 60 MIN.\n\nQuiz : Flutter Quiz",
  //                               //   style: TextStyle(fontSize: 10),
  //                               // ),
  //                               Text(
  //                                 "Duration : 60 MIN.\n\nQuiz :  xyz Quiz\n\nScore : 90",
  //                                 style: TextStyle(fontSize: 8),
  //                               ),
  //                             ],
  //                           ),
  //                           Spacer(),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // );

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        "hi,",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Text("$inputed_username",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // RecentQuizCard(),
                Container(
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
                            child: Text("Recent Attempts",
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
                                    "Duration : 60 Min.\n\nQuiz : Flutter Quiz\n\nScore : 90/100",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 17),
                          Divider(),
                          InkWell(
                            overlayColor:
                                MaterialStatePropertyAll<Color>(Colors.white),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuizReviewPage()));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Get Review",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 10),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                //     child: Row(
                //       children: [
                //         Text(
                //           "Past Attempts",
                //           style: TextStyle(
                //               fontSize: 19, fontWeight: FontWeight.w700),
                //         ),
                //         Spacer(),
                //         InkWell(
                //           onTap: () {},
                //           child: Text(
                //             "View more",
                //             style: TextStyle(fontSize: 10),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 190,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                // PastQuizCard(0),
                //       SizedBox(width: 12),
                //       PastQuizCard(1),
                //       // SizedBox(width: 12),
                //       // PastQuizCard(2),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget PastQuizCard(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // user_id = past_quiz_details[0].userId;
              return Container(
                  //   width: 260,
                  //   // height: 180,
                  //   child: Container(
                  //     margin: const EdgeInsets.symmetric(vertical: 10.0),
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFFeeeeee),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Align(
                  //       alignment: Alignment.topLeft,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(12.0),
                  //         child: Column(
                  //           children: [
                  //             Align(
                  //               alignment: Alignment.topLeft,
                  //               child: Text(
                  //                 "${past_quiz_details[index].subjectName} Quiz",
                  //                 style: TextStyle(
                  //                     fontSize: 10, fontWeight: FontWeight.w700),
                  //               ),
                  //             ),
                  //             SizedBox(height: 10),
                  //             Row(
                  //               children: [
                  //                 Image.network(
                  //                   past_quiz_details[index].subjectImage,
                  //                   height: 80,
                  //                 ),
                  //                 Spacer(),
                  //                 Column(
                  //                   children: [
                  //                     Text(
                  //                       "Date : ${past_quiz_details[index].date}\n\nDuration : 60 MIN.\n\nQuiz : ${past_quiz_details[index].subjectName} Quiz",
                  //                       style: TextStyle(fontSize: 8),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 Spacer(),
                  //               ],
                  //             ),
                  //             Divider(),
                  //             InkWell(
                  //               overlayColor:
                  //                   MaterialStatePropertyAll<Color>(Colors.white),
                  //               onTap: () {
                  //                 // Navigator.push(
                  //                 //     context,
                  //                 //     MaterialPageRoute(
                  //                 //         builder: (context) => QuizReviewPage()));
                  //               },
                  //               child: Row(
                  //                 children: [
                  //                   Text(
                  //                     "Get Review",
                  //                     style: TextStyle(fontSize: 10),
                  //                   ),
                  //                   SizedBox(height: 10),
                  //                   Spacer(),
                  //                   Icon(
                  //                     CupertinoIcons.arrow_right,
                  //                     size: 10,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
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
      );

  // Widget RecentQuizCard() => FutureBuilder(
  //       future: getData(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //             itemCount: 1,
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 decoration: BoxDecoration(
  //                     color: Color(0xFFeeeeee),
  //                     borderRadius: BorderRadius.circular(10)),
  //                 child: Align(
  //                   alignment: Alignment.topLeft,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(12.0),
  //                     child: Column(
  //                       children: [
  //                         Align(
  //                           alignment: Alignment.topLeft,
  //                           child: Text("Recent Attempts",
  //                               style: GoogleFonts.nunitoSans(
  //                                 textStyle: TextStyle(
  //                                     fontSize: 19,
  //                                     fontWeight: FontWeight.w700),
  //                               )),
  //                         ),
  //                         SizedBox(height: 20),
  //                         Row(
  //                           children: [
  //                             Image.asset(
  //                               "assets/images/img_10.png",
  //                               height: 100,
  //                             ),
  //                             Spacer(),
  //                             Row(
  //                               children: [
  //                                 Text(
  //                                   "Duration : 60 Min.\n\nQuiz : Flutter Quiz",
  //                                   style: GoogleFonts.montserrat(
  //                                     textStyle: TextStyle(fontSize: 10),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Spacer(),
  //                           ],
  //                         ),
  //                         SizedBox(height: 17),
  //                         Divider(),
  //                         InkWell(
  //                           overlayColor:
  //                               MaterialStatePropertyAll<Color>(Colors.white),
  //                           onTap: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) => QuizReviewPage()));
  //                           },
  //                           child: Row(
  //                             children: [
  //                               Text(
  //                                 "Get Review",
  //                                 style: GoogleFonts.montserrat(
  //                                   textStyle: TextStyle(fontSize: 10),
  //                                 ),
  //                               ),
  //                               SizedBox(height: 10),
  //                               Spacer(),
  //                               Icon(
  //                                 CupertinoIcons.arrow_right,
  //                                 size: 10,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         } else {
  //           return Center(
  //             child: CircularProgressIndicator(
  //               color: Colors.black,
  //             ),
  //           );
  //         }
  //       },
  //     );

  Future<List<PastQuizDetails>> getData() async {
    final response = await http.get(
      Uri.parse(
          "http://192.168.60.137/gsos/api.php?entity=pastquiz&user_id=$user_id"),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        past_quiz_details.add(PastQuizDetails.fromJson(index));
      }
      return past_quiz_details;
    } else {
      return past_quiz_details;
    }
  }
}
