import 'package:dio/dio.dart';

void signUpRepository({
  required String email,
  required String pass,
  required String name,
  required String userName,
}) async {
  var dio = Dio();
  Map<String, String> data = {
    "email": email,
    "password": pass,
    "name": name,
    "username": userName
  };
  try {
    var res = await dio.post(
        "https://many-chairs-march-43-239-80-146.loca.lt/auth/signup",
        data: data);
    print(res);
  } catch (err) {
    print(err);
  }
}
