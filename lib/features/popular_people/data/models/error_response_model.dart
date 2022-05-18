import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/error_response.dart';
import 'package:meta/meta.dart';
class ErrorResponseModel extends ErrorResponseEntity{
  const ErrorResponseModel({@required String? statusMessage,@required int? statusCode}) : super(statusMessage, statusCode);

  factory ErrorResponseModel.fromJson(Map<String,dynamic> json){
    return ErrorResponseModel(
      statusMessage: json['status_message'],
      statusCode: json['status_code'],
    );
  }


  Map<String,dynamic> toJson(){
    var map = {
      'status_message':statusMessage,
      'status_code':statusCode
    };

    return map;
  }

}