import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart';

import 'failure.dart';

extension AppwriteExceptionX on AppwriteException {
  //Convert AppwriteException to Failure object
  Failure toFailure(StackTrace? stackTrace) => Failure(
        message: message ?? 'Something went wrong',
        code: code,
        stackTrace: stackTrace,
      );
}

extension PlatformX on PlatformException {
  //Convert PlatformException to Failure object
  Failure toFailure(StackTrace? stackTrace) => Failure(
        message: message ?? 'Something went wrong',
        code: int.tryParse(code),
        stackTrace: stackTrace,
      );
}
