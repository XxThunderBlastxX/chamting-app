import 'package:appwrite/appwrite.dart';

import 'failure.dart';

extension AppwriteExceptionX on AppwriteException {
  //Convert AppwriteException to Failure object
  Failure toFailure(StackTrace? stackTrace) => Failure(
        message: message ?? 'Something went wrong',
        code: code,
        stackTrace: stackTrace,
      );
}
