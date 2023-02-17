import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/apis/auth_api.dart';
import 'package:twitter_mobile_clone/core/utils.dart';
import 'package:twitter_mobile_clone/features/auth/view/login_view.dart';
import 'package:twitter_mobile_clone/features/home/view/home_view.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authApi;
  AuthController({required AuthAPI authAPI})
      : _authApi = authAPI,
        super(false);

  Future<model.User?> currentUser() => _authApi.currentUserAccount();

//This function gets trigger whenever the user press sign Up
  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true; // is loading becomes true once signUp is pressed
    final res = await _authApi.signUp(email: email, password: password);
    state = false;
    res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => {
              showSnackBar(context, 'Accounted created! Please login.'),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()))
            });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.login(email: email, password: password);
    state = false;
    // ignore: avoid_print
    res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeView())));
  }
}
