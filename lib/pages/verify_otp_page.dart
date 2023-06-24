import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../buttons/loginbtn.dart';
import 'get_email_page.dart';
import 'new_password_page.dart';

class VerifyOTPPage extends StatefulWidget {
  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Getting value from TextFields
  TextEditingController otpController = TextEditingController();

  var data;

  void GetEmail() async {
    final url =
        "http://192.168.60.137/gsos/api.php?entity=otp&email=$inputed_email";
    try {
      final response = await post(Uri.parse(url), body: {
        'e': inputed_email,
      });
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print(data['success']);
        if (data['success'] == true) {
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "Again OTP sent to $inputed_email",
            fontSize: 13,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );
          // inputed_email = inputed_email;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/verifyOTPpage");
          print("User found with entered emailId");
        } else if (data['success'] == false) {
          // Fluttertoast.showToast(
          //   toastLength: Toast.LENGTH_LONG,
          //   timeInSecForIosWeb: 3,
          //   msg: "User found with entered emailId",
          //   fontSize: 13,
          //   backgroundColor: Colors.black,
          //   textColor: Colors.white,
          //   gravity: ToastGravity.TOP,
          // );

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

  // ignore: non_constant_identifier_names
  void OTPVerification(String otp) async {
    final url =
        "http://192.168.60.137/gsos/api.php?entity=verify_otp&email=$inputed_email&otp=$otp";
    try {
      final response = await post(Uri.parse(url), body: {
        'o': otp,
      });
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print(data['success']);
        if (data['success'] == true) {
          // prin
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => NewPasswordPage(),
              ),
              (route) => false);
          print("Verified");
        } else if (data['success'] == false) {
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "Invalid OTP",
            fontSize: 13,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );

          print("User not found");
        }
        print(url);
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
                    "assets/images/img_13.png",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Check your mail',
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
                    "We have sent an OTP at $inputed_email",
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
                  child: Center(
                    child: TextFormField(
                      style: GoogleFonts.montserrat(),
                      controller: otpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffff6b9080)),
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
                        labelText: 'Enter OTP',
                        labelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xffff6b9080),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty.";
                        } else if (value.length > 5) {
                          return "Please re-check your PIN";
                        } else if (value.length < 5) {
                          return "Please re-check your PIN";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        inputed_email = value!;
                        // print(_email);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: loginbtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      OTPVerification(otpController.text);
                    }
                  },
                  child: const Text("Submit"),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Haven't receive mail?\t",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GetEmail();
                          print("Button pressed");
                        },
                        child: Text(
                          "Resend mail",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffff6b9080),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
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
