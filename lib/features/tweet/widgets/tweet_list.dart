import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/common/error_page.dart';
import 'package:twitter_mobile_clone/common/loading_screen.dart';
import 'package:twitter_mobile_clone/constants/appwrite_constants.dart';
import 'package:twitter_mobile_clone/features/tweet/controller/tweet_controller.dart';
import 'package:twitter_mobile_clone/features/tweet/widgets/tweet_card.dart';
import 'package:twitter_mobile_clone/models/tweet_model.dart';

class TweetList extends ConsumerWidget {
  const TweetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
        data: (tweets) {
          return ref.watch(getLastestTweetProvider).when(
              data: (data) {
                if (data.events.contains(
                    'databases.*.collections.${AppwriteConstants.tweetsCollection}.documents.*.create')) {
                  tweets.insert(0, Tweet.fromMap(data.payload));
                }
                print(data.events);
                return ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final tweet = tweets[index];
                      return TweetCard(tweet: tweet);
                    });
              },
              error: (error, st) => ErrorText(error: error.toString()),
              loading: () {
                return ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (BuildContext context, int index) {
                      final tweet = tweets[index];
                      return TweetCard(tweet: tweet);
                    });
              });
        },
        error: (error, st) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
