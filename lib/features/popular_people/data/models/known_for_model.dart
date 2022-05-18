import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/known_for_entity.dart';
import 'package:meta/meta.dart';

class KnownForModel extends KnownForEntity {
  const KnownForModel({
    @required int? id,
    @required int? gender,
    @required bool? adult,
    @required List<dynamic>? genreIds,
    @required String? backdropPath,
    @required String? mediaType,
    @required String? originalLanguage,
    @required String? originalTitle,
    @required String? posterPath,
    @required String? releaseDate,
    @required String? title,
    @required bool? video,
    @required dynamic voteAverage,
    @required int? voteCount})
      : super(
      id,
      gender,
      adult,
      genreIds,
      backdropPath,
      mediaType,
      originalLanguage,
      originalTitle,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount);

  factory KnownForModel.fromJson(Map<String, dynamic> json){
    return KnownForModel(id: json['id'],
        gender: json['gender'],
        adult: json['adult'],
        genreIds: json['genre_ids'],
        backdropPath: json['backdrop_path'],
        mediaType: json['media_type'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        posterPath: json['poster_path'],
        releaseDate:json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage:json ['vote_average'],
        voteCount: json['vote_count']);
  }

  Map<String,dynamic> toJson(){
    var map = {
      'id':id,
      'gender':gender,
      'adult':adult,
      'genre_ids':genreIds,
      'backdrop_path':backdropPath,
      'media_type':mediaType,
      'original_language':originalLanguage,
      'original_title':originalTitle,
      'poster_path':posterPath,
      'release_date':releaseDate,
      'title':title,
      'video':video,
      'vote_average':voteAverage,
      'vote_count':voteCount
    };

    return map;
  }
}
