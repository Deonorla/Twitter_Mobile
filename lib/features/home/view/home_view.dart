import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_mobile_clone/constants/assets_constants.dart';
import 'package:twitter_mobile_clone/constants/ui_constants.dart';
import 'package:twitter_mobile_clone/features/tweet/views/create_tweet_view.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page = 0;
  final appbar = UiConstants.appbar();

  void onChangePage(int index) {
    setState(() {
      _page = index;
    });
  }

  onCreateTweet() {
    Navigator.push(context,
        MaterialPageRoute(builder: (contetx) => const CreateTweetView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: IndexedStack(
        index: _page,
        children: UiConstants.bottomTabBarPage,
      ), //IndexedStack Helps to maintain state
      floatingActionButton: FloatingActionButton(
          onPressed: onCreateTweet,
          child: const Icon(
            Icons.add,
            color: Styles.whiteColor,
            size: 28,
          )),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Styles.backgroundColor,
        currentIndex: _page,
        onTap: onChangePage,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            _page == 0
                ? AssetsConstants.homeFilledIcon
                : AssetsConstants.homeOutlinedIcon,
            color: Styles.whiteColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            AssetsConstants.searchIcon,
            color: Styles.whiteColor,
          )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
            _page == 2
                ? AssetsConstants.notifFilledIcon
                : AssetsConstants.notifOutlinedIcon,
            color: Styles.whiteColor,
          )),
        ],
      ),
    );
  }
}
