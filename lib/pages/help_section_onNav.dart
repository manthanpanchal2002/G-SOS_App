// import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSectionOnNav extends StatefulWidget {
  @override
  State<HelpSectionOnNav> createState() => _HelpSectionOnNavState();
}

class _HelpSectionOnNavState extends State<HelpSectionOnNav> {
  _copyEmail() {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      msg: "Copied",
      fontSize: 13,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );

    String email = "sos@infopercept.com";
    final val_email = ClipboardData(text: email);
    Clipboard.setData(val_email);
  }

  _copyPhoneNumber() {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      msg: "Copied",
      fontSize: 13,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
    String PhoneNumber = "+919898857117";
    final val__PhoneNumber = ClipboardData(text: PhoneNumber);
    Clipboard.setData(val__PhoneNumber);
  }

  _copyAddress() {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 3,
      msg: "Copied",
      fontSize: 13,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
    String Address =
        "3rd floor, Optionz Complex Opp. Hotel Regenta, CG Road, Navrangpura,Ahmedabad - 380009,Gujarat, India.";
    final val__Address = ClipboardData(text: Address);
    Clipboard.setData(val__Address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Need help?",
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
                color: Color(0xfff6b9080),
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Who we are !",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          "Infopercept Consulting Private Limited take the privacy and security of your personal information very seriously. This Privacy Notice applies to our collection and use of personal information through our website and through our offline business-related interactions with you. Note that this Privacy Notice does not apply to the files that we process for employment purposes; other than resumes and related information that you provide us through our website.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          "We may change this Privacy Notice from time to time. Therefore, we may ask you to check this Privacy Notice occasionally to ensure that you are aware of the most recent version. We will notify you of any changes where we are required to do so.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          "Infopercept Consulting Private Limited has GDPR complaint process.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text(
                          "How Infopercept is helping born-in-the-cloud organisations on AWS to secure their assets and business",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          "Infopercept helps organisations with its open-source cybersecurity solutions, processes, and people to achieve robust cybersecurity architecture. With the support of AWS, they have built a security platform - Invinsense Cloud - which can be used by AWS customers who want to build a next-gen SOC.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          "AWS, with its cloud services, have helped businesses accelerate their digital transformation journeys and gain tremendous business growth. However, many of them don’t know which cybersecurity solutions to use for protecting their assets in the AWS environment, and also lack best practices to use these solutions. For such organisations, Infopercept launched Invinsense Cloud, an integrated cybersecurity platform that provides security in the AWS environment. The company also helps relevant teams build a next-gen Security Operations Center (SOC) that takes care of their cloud security 24x7.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        title: Text(
                          "Providing a comprehensive cybersecurity solution",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                          '''Two major approaches in cybersecurity - 'Prevention' and 'Detection'. "Due to the interconnected world and corporations, there are chances of loopholes in technologies, processes, and people, which adversaries take advantage of and enter an organisation. It's here that organisations need to have a proper response mechanism in place''',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.mail,
                          size: 23,
                        ),
                        title: Text(
                          "Email address",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Text(
                          "sos@infopercept.com",
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                        trailing: InkWell(
                          overlayColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          onTap: _copyEmail,
                          child: Icon(
                            Icons.copy,
                            size: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          size: 23,
                        ),
                        title: Text(
                          "Contact number",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Text(
                          "+919898857117",
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                        trailing: InkWell(
                            overlayColor:
                                MaterialStatePropertyAll<Color>(Colors.white),
                            onTap: _copyPhoneNumber,
                            child: Icon(Icons.copy, size: 15)),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_city,
                          size: 23,
                        ),
                        title: Text(
                          "INDIA | Ahmedabad",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        subtitle: Text(
                          "3rd floor, Optionz Complex Opp. Hotel Regenta, CG Road, Navrangpura, Ahmedabad - 380009, Gujarat, India.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                        trailing: InkWell(
                          overlayColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                          onTap: _copyAddress,
                          child: Icon(Icons.copy, size: 15),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
