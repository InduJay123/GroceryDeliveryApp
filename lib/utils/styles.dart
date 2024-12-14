import 'package:flutter/material.dart';
import 'colors.dart';

const TextStyle descriptionStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

const textInputDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color:mainColor, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: mainColor, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  ),
  labelStyle: TextStyle(color: Colors.black),
);