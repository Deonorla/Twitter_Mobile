import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/features/tweet/widgets/tweet_list.dart';
import '../theme/styles.dart';
import 'assets_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiConstants {
  static AppBar appbar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Styles.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPage = [
    TweetList(),
    const Text('Search Screen'),
    const Text('Notification Screen'),
  ];
}
