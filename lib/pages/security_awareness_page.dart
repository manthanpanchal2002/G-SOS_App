import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Routes/routes.dart';
import '../data/SecurityAwarenessDetails.dart';

int? id;
String? title;

class SecurityAwarenessPage extends StatefulWidget {
  @override
  State<SecurityAwarenessPage> createState() => _SecurityAwarenessPageState();
}

class _SecurityAwarenessPageState extends State<SecurityAwarenessPage> {
  List<SecurityAwarenessDetails> security_awareness_details = [];
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
        title: Text(
          "Security Awareness",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17,
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0.5,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: security_awareness_details.length,
              itemBuilder: (context, index) {
                return Container(
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
                            "${security_awareness_details[index].catagoryImage}"),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "#",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Text(
                                  "${security_awareness_details[index].catagoryName}",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  overlayColor: MaterialStatePropertyAll<Color>(
                                      Colors.white),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/galleryForSAPpage");
                                    id = security_awareness_details[index].id;
                                    title = security_awareness_details[index]
                                        .catagoryName;
                                    print(security_awareness_details[index].id);
                                  },
                                  child: Icon(
                                    CupertinoIcons.arrow_right,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
    );
  }

  Future<List<SecurityAwarenessDetails>> getData() async {
    final response = await http.get(Uri.parse(
        "${ipAddress}api.php?entity=contentawarenesscatagory"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        security_awareness_details
            .add(SecurityAwarenessDetails.fromJson(index));
      }
      return security_awareness_details;
    } else {
      return security_awareness_details;
    }
  }
}
