import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//RegisterRepository is a helper class to access http client
class RegisterRepository {
  //dio client instance
  final dio = Dio();

  //FlutterSecureStorage instance
  final storage = const FlutterSecureStorage();

  //base url of whole url string
  final String? baseUrl;

  RegisterRepository({this.baseUrl});

  //signInRepository is a function to send email and password to server
  Future<bool> signInRepository(String email, String pass) async {
    Map<String, String> data = {"email": email, "password": pass};

    try {
      //response variable to post data to server
      var res = await dio.post(
        "$baseUrl/auth/signin",
        data: data,
      );
      if (res.statusCode == 200) {
        storage.write(key: "token", value: res.data["token"]);
        return true;
      } else {
        return Future.error("Ops something went wrong !!");
      }
    } on DioError catch (err) {
      switch (err.response!.statusCode) {
        case 422:
          return Future.error("Status unprocessable entity");
        case 503:
          return Future.error("Server Error encountered !!");
        case 401:
          return Future.error("Ops!! You enter either wrong Email or Password");
        case 500:
          return Future.error("Server error encountered !!");
        default:
          return Future.error("Ops something went wrong !!");
      }
    }
  }

  //signUpRepository is a function to send data to server for sign-up
  Future<bool> signUpRepository({
    required String email,
    required String pass,
    required String name,
    required String userName,
  }) async {
    Map<String, String> data = {
      "email": email,
      "password": pass,
      "name": name,
      "username": userName
    };
    try {
      //response variable to post data to server
      var res = await dio.post("$baseUrl/auth/signup", data: data);

      if (res.statusCode == 200) {
        storage.write(key: "token", value: res.data["token"]);
        return true;
      } else {
        return Future.error("Ops something went wrong !!");
      }
    } on DioError catch (err) {
      switch (err.response!.statusCode) {
        case 422:
          return Future.error("Status unprocessable entity");
        case 409:
          return Future.error("Opps!! Email already exist !!");
        case 503:
          return Future.error("Server error encountered !!");
        case 500:
          return Future.error("Server error encountered !!");
        default:
          return Future.error("Ops something went wrong !!");
      }
    }
  }
}
