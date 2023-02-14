import 'package:flutter/material.dart';
import '../theme/styles.dart';
import 'assets_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UiConstants {
  static AppBar appbar(){
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Styles.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }
 }