import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/common/error_page.dart';
import 'package:twitter_mobile_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';
import '../../../common/loading_screen.dart';
import '../../../models/tweet_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCard extends ConsumerWidget {
  final Tweet tweet;
  const TweetCard({Key? key, required this.tweet}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDetailsProvider(tweet.uid)).when(
        data: (user) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePicture),
                      radius: 35,
                    ),
                  ),
                  Column(
                    children: [
                      // retweeted
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              user.name,
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '@${user.name} . ${timeago.format(tweet.tweetedAt, locale: 'en_short')}',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Styles.greyColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        error: ((error, stackTrace) => ErrorText(error: error.toString())),
        loading: () => const Loader());
  }
}
