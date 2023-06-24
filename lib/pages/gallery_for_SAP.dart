import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/pages/security_awareness_page.dart';
import '../data/GalleryForSAPDetails.dart';

String? image;

class GalleryForSAPPage extends StatefulWidget {
  @override
  State<GalleryForSAPPage> createState() => _GalleryForSAPPagePageState();
}

class _GalleryForSAPPagePageState extends State<GalleryForSAPPage> {
  List<GalleryForSapDetails> gallery_for_SAP = [];
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
          "$title",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
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
              itemCount: gallery_for_SAP.length,
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
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            "${gallery_for_SAP[index].contentImage}"),
                      ),
                      // SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: InkWell(
                      //     overlayColor:
                      //         MaterialStatePropertyAll<Color>(Colors.white),
                      //     onTap: () {
                      //       print("Downloaded");
                      //     },
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           "Download",
                      //           style: GoogleFonts.montserrat(
                      //             textStyle: TextStyle(
                      //               fontSize: 13,
                      //             ),
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         InkWell(
                      //           overlayColor: MaterialStatePropertyAll<Color>(
                      //               Colors.white),
                      //           onTap: () {},
                      //           child: Icon(
                      //             CupertinoIcons.cloud_download,
                      //             size: 15,
                      //             color: Colors.green,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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

  Future<List<GalleryForSapDetails>> getData() async {
    final response = await http.get(Uri.parse(
        "http://192.168.60.137/gsos/api.php?entity=contentawareness&catagory_id=$id"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        gallery_for_SAP.add(GalleryForSapDetails.fromJson(index));
      }
      return gallery_for_SAP;
    } else {
      return gallery_for_SAP;
    }
  }
}
