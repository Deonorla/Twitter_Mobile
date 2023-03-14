import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_mobile_clone/common/common.dart';
import 'package:twitter_mobile_clone/constants/assets_constants.dart';
import 'package:twitter_mobile_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  const CreateTweetView({Key? key}) : super(key: key);
  @override
  ConsumerState<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  final tweetTextController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    tweetTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    // print(currentUser);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          RoundedSmallButton(
              onTap: () {},
              label: 'Tweet',
              backgroundColor: Styles.blueColor,
              textColor: Styles.whiteColor)
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.profilePicture),
                      radius: 30,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: TextField(
                      controller: tweetTextController,
                      style: const TextStyle(fontSize: 22),
                      decoration: const InputDecoration(
                          hintText: 'What\'s happening?',
                          hintStyle: TextStyle(
                              color: Styles.greyColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                          border: InputBorder.none),
                      maxLines: null,
                    )),
                  ],
                )
              ]),
            )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: Styles.greyColor, width: 0.3))),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0)
              ..copyWith(
                left: 15,
                right: 15,
              ),
            child: SvgPicture.asset(AssetsConstants.galleryIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0)
              ..copyWith(
                left: 15,
                right: 15,
              ),
            child: SvgPicture.asset(AssetsConstants.gifIcon),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0)
              ..copyWith(
                left: 15,
                right: 15,
              ),
            child: SvgPicture.asset(AssetsConstants.emojiIcon),
          )
        ]),
      ),
    );
  }
}
