import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Routes/routes.dart';
import '../data/AssignedQuizDetails.dart';
import 'exam_details_page.dart';
import 'package:http/http.dart' as http;
import 'landing_page.dart';

int? subj_id;
late int dur;
String? title_name;

class AssignQuizPage extends StatefulWidget {
  @override
  State<AssignQuizPage> createState() => _AssignQuizPageState();
}

class _AssignQuizPageState extends State<AssignQuizPage> {
  List<AssignedQuizDetails> assigned_quiz_details = [];
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
          "Assigned Quiz",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
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
                itemCount: assigned_quiz_details.length,
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
                              subj_id = assigned_quiz_details[index].subjectId;
                              dur = assigned_quiz_details[index].duration;
                              title_name =
                                  assigned_quiz_details[index].subjectName;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExamDetailsPage()));
                            },
                            leading: Image.network(
                              "${assigned_quiz_details[index].subjectImage}",
                              height: 18,
                            ),
                            title: Text(
                              "${assigned_quiz_details[index].subjectName}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Duration : ${assigned_quiz_details[index].duration} min",
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
                                  "Passing criteria : ${assigned_quiz_details[index].criteria}%",
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

  Future<List<AssignedQuizDetails>> getData() async {
    final response = await http.get(Uri.parse(
        "http://$manthan_network/gsos/api.php?entity=assigned&user_id=$user_id"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        assigned_quiz_details.add(AssignedQuizDetails.fromJson(index));
      }
      return assigned_quiz_details;
    } else {
      return assigned_quiz_details;
    }
  }
}
