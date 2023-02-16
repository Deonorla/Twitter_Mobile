import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_mobile_clone/core/core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:twitter_mobile_clone/core/provider.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

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
      //create new User on Sign Up.
      final account = await _account.create(
          userId: 'unique()', email: email, password: password);
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? 'Some unexpected error occured', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
