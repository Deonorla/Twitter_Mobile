import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_mobile_clone/constants/appwrite_constants.dart';
import 'package:twitter_mobile_clone/core/core.dart';
import 'package:twitter_mobile_clone/core/provider.dart';
import 'package:twitter_mobile_clone/models/user_model.dart';

final userAPIProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appwriteDatabaseProvider));
});

abstract class IUserApi {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserApi {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
          collectionId: AppwriteConstants.usersCollection,
          documentId: 'unique()',
          data: userModel.toMap());
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(Failure(e.message ?? 'Some Unexpected Error Occurred', st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
