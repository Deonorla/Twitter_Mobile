class AppwriteConstants {
  static const String databaseId = '640ed3b8cf33cd3ecdbc';
  static const String projectId = '640ed0b0d7c679bec5d5';
  static const String endPoint = 'http://localhost:80/v1';
  static const String usersCollection = '640ed9aba7e87499b491';
  static const String tweetsCollection = '64148390462ffbb9f9e9';
  static const String imagesBucket = '641b3841009cef102f2c';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
