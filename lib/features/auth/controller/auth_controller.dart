import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_mobile_clone/apis/auth_api.dart';
import 'package:twitter_mobile_clone/core/utils.dart';

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authApi;
  AuthController({required AuthAPI authAPI})
      : _authApi = authAPI,
        super(false);
  // state = isLoading

//This function gets trigger whenever the user press sign Up
  void signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true; // is loading becomes true once signUp is pressed
    final res = await _authApi.signUp(email: email, password: password);
    res.fold((l) => showSnackBar(context, l.message), (r) => r.name);
  }
}