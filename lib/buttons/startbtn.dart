import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ButtonStyle startbtn = ElevatedButton.styleFrom(
  minimumSize: Size(400, 55),
  backgroundColor: Color(0xffff6b9080),
  foregroundColor: Color(0xfffff6fff8),
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  textStyle: GoogleFonts.nunitoSans(
    textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
  ),
);
