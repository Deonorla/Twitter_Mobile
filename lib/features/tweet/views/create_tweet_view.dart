import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_mobile_clone/common/common.dart';
import 'package:twitter_mobile_clone/constants/assets_constants.dart';
import 'package:twitter_mobile_clone/core/utils.dart';
import 'package:twitter_mobile_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_mobile_clone/features/tweet/controller/tweet_controller.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  const CreateTweetView({Key? key}) : super(key: key);
  @override
  ConsumerState<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  final tweetTextController = TextEditingController();
  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    tweetTextController.dispose();
  }

  void onPickImages() async {
    images = await pickImages();
    setState(() {});
  }

  void shareTweet() {
    ref.read(tweetControllerProvider.notifier).shareTweet(
        images: images, text: tweetTextController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    final isLoading = ref.watch(tweetControllerProvider);
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
              onTap: shareTweet,
              label: 'Tweet',
              backgroundColor: Styles.blueColor,
              textColor: Styles.whiteColor)
        ],
      ),
      body: isLoading || currentUser == null
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
                ),
                if (images.isNotEmpty)
                  CarouselSlider(
                      items: images.map((file) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Image.file(file));
                      }).toList(), // toList helps to convert to a list
                      options: CarouselOptions(
                          height: 400, enableInfiniteScroll: false))
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
            child: GestureDetector(
                onTap: onPickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon)),
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
