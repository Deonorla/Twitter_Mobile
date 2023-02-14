import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/features/auth/view/login_view.dart';
import 'package:twitter_mobile_clone/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}

