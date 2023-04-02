import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';

class HashtagText extends StatelessWidget {
  final String text;
  const HashtagText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = [];

    text.split(' ').forEach((element) {
      if (element.startsWith('#')) {
        textSpans.add(TextSpan(
            text: '$element ',
            style: const TextStyle(
                fontSize: 18,
                color: Styles.blueColor,
                fontWeight: FontWeight.bold)));
      } else if (element.startsWith('www.') || element.startsWith('https://')) {
        textSpans.add(TextSpan(
            text: '$element ',
            style: const TextStyle(
              fontSize: 18,
              color: Styles.blueColor,
            )));
      } else {
        textSpans.add(TextSpan(
            text: '$element ',
            style: const TextStyle(
              fontSize: 18,
            )));
      }
    });

    return RichText(text: TextSpan(children: textSpans));
  }
}
