import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import '../buttons/loginbtn.dart';
import 'about_us_page.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

// ignore: unused_field, non_constant_identifier_names
String? inputed_username;
// ignore: unused_field, non_constant_identifier_names
String? inputed_password;

// ignore: non_constant_identifier_names
int? user_id;
// ignore: non_constant_identifier_names
String? user_email;
// ignore: non_constant_identifier_names
String? user_name;
// ignore: non_constant_identifier_names
String? user_contact;

class _LandingPageState extends State<LandingPage> {
  // Getting value from TextFields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var data;

  // ignore: non_constant_identifier_names
  void Login(String username, String password) async {
    final url =
        "http://192.168.60.137/gsos/api.php?entity=login&username=$username&password=$password";
    try {
      final response =
          await post(Uri.parse(url), body: {'u': username, 'p': password});
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        print(data['success']);
        if (data['success'] == true) {
          // ignore: use_build_context_synchronously
          user_id = data['id'];
          user_email = data['email'];
          user_name = data['username'];
          user_contact = data['ph_no'];
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => HomePage()),
            ),
          );
          _formKey.currentState!.reset();
          // ignore: avoid_print
          print("User found");
        } else if (data['success'] == false) {
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 3,
            msg: "User not found",
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegExp username_valid = RegExp(r"^[a-z]{4,}$");
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
              icon: const Icon(
                CupertinoIcons.question_circle_fill,
                color: Colors.black,
                size: 20,
              )),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/oneTimepage");
            },
            icon: const Icon(
              Icons.start,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      body: Material(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 45.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/img_1.png",
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome,',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff6b9080),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('Nice to see you again! Login to continue...',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xfffffa4c3b2),
                          ),
                        )),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          controller: usernameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffff6b9080)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            // hintText: 'username must be in lowercase',
                            floatingLabelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xffff6b9080),
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xffff6b9080),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            inputed_username = value;
                            print(inputed_username);
                          },
                          validator: (username) {
                            if (username!.isEmpty) {
                              return "Username is required.";
                            } else if (username.length < 4) {
                              return "username is too short.";
                            } else if (!username_valid.hasMatch(username)) {
                              return "Invalid Username.";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            inputed_username = value!;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffff6b9080)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            // hintText:
                            //     'Minimun one lowercase, UPPERCASE, Special character and numeric value.',
                            hintStyle: TextStyle(fontSize: 10),
                            labelText: 'Password',
                            floatingLabelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xffff6b9080),
                                fontSize: 15,
                              ),
                            ),
                            labelStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Color(0xffff6b9080),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            inputed_password = value;
                            print(inputed_password);
                          },
                          validator: (password) {
                            if (password!.isEmpty) {
                              return "Password is required.";
                            } else if (password.length < 8) {
                              return "Password is too short.";
                            } else if (!pass_valid.hasMatch(password)) {
                              return "Password must have minimun one lowercase, UPPERCASE,\nSpecial character and numeric value.";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            inputed_password = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/getEmailpage");
                                // print("Button clicked");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 2.0,
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xffff6b9080),
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
        child: ElevatedButton(
          style: loginbtn,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Login(usernameController.text, passwordController.text);
            }
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
