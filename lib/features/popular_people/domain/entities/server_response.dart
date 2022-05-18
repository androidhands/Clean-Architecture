import 'package:equatable/equatable.dart';

class ServerResponse extends Equatable{
  final  int? page;
  final  dynamic results;
  final  int? totalPages;
  final  int? totalResults;

  const ServerResponse(this.page, this.results, this.totalPages, this.totalResults);

  @override
  List<Object> get props => [page!,results,totalPages!,totalResults!];

}