import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle buttonStyle() {
  return const TextStyle(color: CupertinoColors.black, fontSize: 15,);
}

TextStyle quoteStyle() {
  return const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}

TextStyle quoteStyleSmall() {
  return const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}

TextStyle titleStyle() {
  return const TextStyle(
    color: Colors.white,
    wordSpacing: 5,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
}

BoxDecoration tableDecoration() {
  return const BoxDecoration(
    color: Colors.redAccent,
  );
}

