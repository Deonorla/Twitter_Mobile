import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/common/common.dart';
import 'package:twitter_mobile_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_mobile_clone/features/home/view/home_view.dart';
import 'package:twitter_mobile_clone/theme/theme.dart';
import 'package:twitter_mobile_clone/features/auth/view/signup_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if (user != null) {
              return const HomeView();
            }
            return const SignUpView();
          },
          error: (error, stackTrace) => ErrorPage(error: error.toString()),
          loading: () => const LoadingPage()),
    );
  }
}
