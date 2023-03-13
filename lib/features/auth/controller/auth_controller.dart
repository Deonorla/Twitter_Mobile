import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/apis/auth_api.dart';
import 'package:twitter_mobile_clone/apis/user_api.dart';
import 'package:twitter_mobile_clone/core/utils.dart';
import 'package:twitter_mobile_clone/features/auth/view/login_view.dart';
import 'package:twitter_mobile_clone/features/home/view/home_view.dart';
import 'package:twitter_mobile_clone/models/user_model.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authAPI: ref.watch(authAPIProvider), userAPI: ref.watch(userAPIProvider));
});

final currentUserDetailsProvider = FutureProvider((ref) {
  final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
  print('id: $currentUserId');
  final userDetails = ref.watch(userDetailsProvider(currentUserId));
  return userDetails.value;
});

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authApi;
  final UserAPI _userApi;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authApi = authAPI,
        _userApi = userAPI,
        super(false);

  Future<model.Account?> currentUser() => _authApi.currentUserAccount();

//This function gets trigger whenever the user press sign Up
  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true; // is loading becomes true once signUp is pressed
    final res = await _authApi.signUp(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) async {
      UserModel userModel = UserModel(
          email: email,
          name: getNameFromEmail(email),
          followers: const [],
          following: const [],
          profilePicture: '',
          bannerPic: '',
          uid: r.$id,
          bio: '',
          isTwitterBlue: false);
      final res2 = await _userApi.saveUserData(userModel);
      res2.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Accounted created! Please login.');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      });
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.login(email: email, password: password);
    state = false;
    res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeView())));
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userApi.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }
}
