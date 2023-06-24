import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_app/ColorPalette/colors.dart';

import '../data/TrainingDetails.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

String? training_title;
String? training_video;

class TrainingPage extends StatefulWidget {
  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  List<TrainingDetails> training_details = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Knowledge tutorials",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: training_details.length,
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor: MaterialStatePropertyAll<Color>(Colors.white),
                  onTap: () {
                    print("clicked");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFeeeeee),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            "${training_details[index].trainingImage}",
                            width: 200,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Spacer(),
                                  Text(
                                    "${training_details[index].trainingName}",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    CupertinoIcons.arrow_right,
                                    size: 13,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
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
    );
  }

  Future<List<TrainingDetails>> getData() async {
    final response = await http
        .get(Uri.parse("http://192.168.60.137/gsos/api.php?entity=training"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        training_details.add(TrainingDetails.fromJson(index));
      }
      return training_details;
    } else {
      return training_details;
    }
  }
}
