import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificatePage extends StatelessWidget {
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
        elevation: 0.0,
        scrolledUnderElevation: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Column(
            children: [
              Image.asset("assets/images/img_6.png"),
              // Divider(),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                leading: Icon(
                  CupertinoIcons.circle,
                ),
                title: Text(
                  "Django Quiz",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text(
                  "Qualified (Download Certificate)",
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.cloud_download),
                    color: Colors.green),
              ),
            ],
          )),
        )),
      ),
    );
  }
}
