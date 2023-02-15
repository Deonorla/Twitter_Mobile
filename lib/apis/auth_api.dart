import 'package:fpdart/fpdart.dart';
import 'package:twitter_mobile_clone/core/core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;

// when you want to Signup / get user account => use Account from service
// when you want to access user account => use model.Account

abstract class IAuthAPI {
  FutureEither<model.User> signUp(
      {required String email, required String password});
}

class AuthAPI implements IAuthAPI {
  final Account _account; // private account variable.
  AuthAPI({required Account account}) : _account = account; // constructor to
  // make the instance of new variable "account" to accessible outside of this class

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: 'unique()', email: email, password: password);
      return right(account);
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
