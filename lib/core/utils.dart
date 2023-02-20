import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

String getNameFromEmail(String email) {
  //  deonoluleye@gmail.com
  // list = ["deonoluleye",  "@gamil.com"]
  //first element [0] = deonoluleye
  return email.split('@')[0];
}
