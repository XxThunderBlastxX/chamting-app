import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? code;
  final StackTrace? stackTrace;
  const Failure({required this.message, this.code, this.stackTrace});

  @override
  List<Object?> get props => [message, code, stackTrace];
}
