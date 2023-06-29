import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:my_app/pages/verify_otp_page.dart';
import '../Routes/routes.dart';
import '../buttons/loginbtn.dart';


class GetEmailPage extends StatefulWidget {
  @override
  State<GetEmailPage> createState() => _GetEmailPageState();
}

String? inputed_email;

class _GetEmailPageState extends State<GetEmailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegExp email_validation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Getting value from TextFields
  TextEditingController emailController = TextEditingController();

  var data;

  // ignore: non_constant_identifier_names
  void GetEmail(String email) async {
    final url = "${ipAddress}api.php?entity=otp&email=$email";
    try {
      final response = await post(Uri.parse(url), body: {
        'e': email,
      });
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print(data['success']);
        if (data['success'] == true) {
          inputed_email = email;
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => VerifyOTPPage(),
              ),
              (route) => false);
          print("User found with entered emailId");
        } else if (data['success'] == false) {
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "User found with entered emailId",
            fontSize: 13,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );

          print("User not found");
        }
        // print(url);
        print("Success to get API Data");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/landingpage");
          },
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/img_12.png",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Reset password',
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff6b9080)),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter the email associated with this account and we will send you OTP.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Color(0xfffffa4c3b2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: GoogleFonts.montserrat(),
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffff6b9080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          floatingLabelStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xffff6b9080),
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Color(0xffff6b9080),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required.";
                          } else if (!email_validation.hasMatch(value)) {
                            return "Invalid email.";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          inputed_email = value!;
                          // print(_email);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: loginbtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      GetEmail(emailController.text);
                      print("Mail Sent");
                    }
          
                  },
                  child: const Text("Get OTP"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
