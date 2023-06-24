import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../buttons/loginbtn.dart';
import 'get_email_page.dart';
import 'landing_page.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  String? _newPassword;
  String? _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  TextEditingController setPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var data;

  // ignore: non_constant_identifier_names
  void ResetPassword(String set, String confirm) async {
    final url =
        "http://192.168.60.137/gsos/api.php?entity=reset_password&email=$inputed_email&newpassword=$set&confirmpassword=$confirm";
    try {
      final response = await post(
        Uri.parse(url),
        body: {
          's': set,
          'c': confirm,
        },
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print(data['success']);
        if (data['success'] == true) {
          print("Successfully changed");
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "Password successfully changed",
            fontSize: 13,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
          );
        } else if (data['success'] == false) {
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
                    "assets/images/img_14.png",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create new password',
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
                    'Your new password must be different from previous used passwords',
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
                        controller: setPasswordController,
                        obscureText: true,
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
                          labelText: 'Set Password',
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
                          } else if (value.length < 8) {
                            return "Password is too short.";
                          } else if (!pass_valid.hasMatch(value)) {
                            return "Password must have minimun one lowercase, UPPERCASE,\nSpecial character and numeric value.";
                          } else if (!pass_valid.hasMatch(value)) {
                            return "Invalid password.";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _newPassword = value;
                        },
                        onSaved: (value) {
                          _newPassword = value!;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        style: GoogleFonts.montserrat(),
                        controller: confirmPasswordController,
                        obscureText: true,
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
                          labelText: 'Confirm Password',
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
                          } else if (_newPassword != _confirmPassword) {
                            return "Password not matched.";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          _confirmPassword = value;
                        },
                        onSaved: (value) {
                          _confirmPassword = value!;
                          // print(_email);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: loginbtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _newPassword == _confirmPassword) {
                      ResetPassword(setPasswordController.text,
                          confirmPasswordController.text);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LandingPage(),
                          ),
                          (route) => false);
                      _formKey.currentState?.reset();

                      print("Password Updated");
                    }
                    _formKey.currentState?.save();
                  },
                  child: const Text("Save"),
                ),
                // const SizedBox(height: 37.0),
                // Container(
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.pushNamed(context, "/landingpage");
                //       print("Button pressed");
                //     },
                //     child: Text(
                //       "Back to login",
                //       style: GoogleFonts.montserrat(
                //         textStyle: TextStyle(
                //           decoration: TextDecoration.underline,
                //           color: Colors.black,
                //           fontSize: 13,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
