import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UnbordingContent {
  String image;
  Color colors;
  String text;

  UnbordingContent(
      {required this.colors, required this.image, required this.text});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      colors: const Color.fromARGB(255, 109, 111, 113),
      image: "assets/image1.png",
      text: "Welcome IceCream !"),
  UnbordingContent(
      colors: const Color.fromARGB(255, 82, 197, 84),
      image: "assets/image11.png",
      text: "Children's world"),
  UnbordingContent(
      colors: const Color.fromARGB(255, 144, 40, 162),
      image: "assets/image111.png",
      text: "Come to it !"),
];
