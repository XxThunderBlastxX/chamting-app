import 'package:appwrite/appwrite.dart';

abstract class AppwriteInstance {
  static Client client = Client();
  static Account account = Account(client);
}
