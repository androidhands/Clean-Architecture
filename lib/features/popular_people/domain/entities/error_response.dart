import 'package:equatable/equatable.dart';

class ErrorResponseEntity extends Equatable{
  final String? statusMessage;
  final int? statusCode;
  const ErrorResponseEntity(this.statusMessage, this.statusCode);
  @override
  List<Object?> get props =>[statusMessage,statusCode];

}