import 'package:dio/dio.dart';

//RegisterRepository is a helper class to access http client
class RegisterRepository {
  //dio client instance
  final dio = Dio();

  //base url of whole url string
  final String? baseUrl;

  RegisterRepository({this.baseUrl});

  //signInRepository is a function to send email and password to server
  Future<String?> signInRepository(String email, String pass) async {
    Map<String, String> data = {"email": email, "password": pass};
    try {
      //response variable to post data to server
      var res = await dio.post(
        "$baseUrl/auth/signin",
        data: data,
      );

      print(res.data);

      switch (res.statusCode) {
        case 200:
          return null;
      }
    } on DioError catch (err) {
      switch (err.response!.statusCode) {
        case 422:
          return "Status unprocessable entity";
        case 503:
          return "Server Error encountered !!";
        case 401:
          return "Ops!! You enter either wrong Email or Password";
        case 500:
          return "Server error encountered !!";
        default:
          return "Ops something went wrong !!";
      }
    }
    return null;
  }

  //signUpRepository is a function to send data to server for sign-up
  Future<String?> signUpRepository({
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

      print(res);

      switch (res.statusCode) {
        case 200:
          return null;
      }
    } on DioError catch (err) {
      switch (err.response!.statusCode) {
        case 422:
          return "Status unprocessable entity";
        case 409:
          return "Opps!! Email already exist !!";
        case 503:
          return "Server error encountered !!";
        case 500:
          return "Server error encountered !!";
        default:
          return "Ops something went wrong !!";
      }
    }
    return null;
  }
}
