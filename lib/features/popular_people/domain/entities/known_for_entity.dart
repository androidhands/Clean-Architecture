import 'dart:ffi';

import 'package:equatable/equatable.dart';

class KnownForEntity extends Equatable{
  final int? id;
  final int? gender;
  final bool? adult;
  final List<dynamic>? genreIds;
  final String? backdropPath;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final dynamic voteAverage;
  final int? voteCount;

  const KnownForEntity(this.id, this.gender, this.adult, this.genreIds, this.backdropPath, this.mediaType
      , this.originalLanguage, this.originalTitle, this.posterPath, this.releaseDate
      , this.title, this.video, this.voteAverage, this.voteCount);

  @override
  List<Object?> get props =>[id!,gender!,adult!,genreIds!,
  backdropPath!,mediaType!,originalLanguage!,originalTitle!,posterPath!,releaseDate!,title!,video!,voteAverage!,voteCount!];

}