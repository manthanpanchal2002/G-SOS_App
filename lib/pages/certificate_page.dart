import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Routes/routes.dart';
import '../data/UserCertificateDetails.dart';
import 'landing_page.dart';

class CertificatePage extends StatefulWidget {
  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  List<UserCertificateDetails> user_certificate_details = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Certificates",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17,
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold),
          ),
        ),
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
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: user_certificate_details.length,
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
                            leading: Image.network(
                              "${user_certificate_details[index].subjectImage}",
                              height: 25,
                            ),
                            title: Text(
                              "${user_certificate_details[index].subjectName}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Score : ${user_certificate_details[index].percentage}%",
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
                                  "Grade : ${user_certificate_details[index].grade}",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              CupertinoIcons.cloud_download,
                              color: Colors.green,
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

  Future<List<UserCertificateDetails>> getData() async {
    final response = await http.get(
        Uri.parse("${ipAddress}api.php?entity=certificate&user_id=$user_id"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        user_certificate_details.add(UserCertificateDetails.fromJson(index));
      }
      return user_certificate_details;
    } else {
      return user_certificate_details;
    }
  }
}
