import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<String?> getToken() async {
  var isPresent = await storage.containsKey(key: "token");
  String? token;

  if (isPresent) {
    token = await storage.read(key: "token");
  } else {
    return null;
  }

  return token;
}

Future<void> removeToken() async {
  await storage.delete(key: "token");
}
