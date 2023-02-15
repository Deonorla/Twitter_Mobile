import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String inputText;
  const AuthField({Key? key, required this.controller, required this.inputText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: inputText,
        hintStyle: const TextStyle(
          fontSize: 18
        ),
        contentPadding: const EdgeInsets.all(22),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Styles.blueColor,
            width: 3
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Styles.greyColor

          )
        )
      ),

    );
  }
}
