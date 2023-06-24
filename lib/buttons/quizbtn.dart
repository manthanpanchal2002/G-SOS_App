import 'package:flutter/material.dart';

final ButtonStyle quizbtn = ElevatedButton.styleFrom(
  minimumSize: Size(85, 45),
  backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  elevation: 0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
);
