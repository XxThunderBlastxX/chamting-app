import 'package:jwt_decoder/jwt_decoder.dart';

////// false means quantity is invalid and true means it is valid

//Validates an Email
bool? validateEmail(String? email) {
  //pattern is userNameWithSpecialCharacterAndNumber@domain.tld
  //special character includes only '_' or '-' or '.'
  String pattern = r'^(([a-zA-Z0-9\\_\-\.\\]+)@([a-z]+).([a-z]+))$';

  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(email ?? '')) {
    return false;
  } else {
    return true;
  }
}

//Validates Name
bool? validateName(String? name) {
  String pattern = r'^([a-zA-Z\D].+)$';

  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(name ?? '')) {
    return false;
  } else {
    return true;
  }
}
//'Enter Password with atleast one special character,\nnumber and in range of 8-12 characters  '

//Validate password
bool? validatePassword(String? pass) {
  String pattern = r'^([a-z\SA-Z\S0-9]{8,12})$';

  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(pass ?? '')) {
    return false;
  } else {
    return true;
  }
}

//validateJwtToken is a method to validate jwt token
bool validateJwtToken(String? token) {
  bool hasExpired;

  if (token == null) {
    hasExpired = true;
  } else {
    hasExpired = JwtDecoder.isExpired(token);
  }

  // true: if the token is already expired
  // false: if the token is not expired
  return hasExpired;
}
