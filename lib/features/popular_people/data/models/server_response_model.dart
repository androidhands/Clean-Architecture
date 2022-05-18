import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/server_response.dart';
import 'package:meta/meta.dart';
class ServerResponseModel extends ServerResponse {
  ServerResponseModel({
    @required int? page,@required results,@required int? totalPages,@required int? totalResults})
      : super(page, results, totalPages, totalResults);

  factory ServerResponseModel.fromJson(Map<String,dynamic> json){
    return ServerResponseModel(
      page: json['page'],
      results: json['results'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],

    );
  }

  Map<String,dynamic> toJson(){
    var map = {
      'page':page,
      'results':results,
      'total_pages':totalPages,
      'total_results':totalResults,
    };
    return map;
  }
}
