import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/known_for_entity.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:meta/meta.dart';
class PopularPeopleModel extends PopularPeopleEntity {
  PopularPeopleModel(
      {@required int? id,
        @required String? name,
        @required int? gender,
        @required bool? adult,
        @required dynamic knownFor,
        @required String? knownForDepartment,
        @required double? popularity,
        @required String? profilePath})
      : super(id, name, gender, adult,knownFor, knownForDepartment, popularity,
            profilePath);

  factory PopularPeopleModel.fromJson(Map<String,dynamic> json){
    return PopularPeopleModel(
      id:json['id'],
      name:json['name'],
      gender:json['gender'],
      adult:json['adult'],
      knownFor: json['known_for'],
      knownForDepartment:json['known_for_department'],
      popularity:json['popularity'],
      profilePath:json['profile_path'],

    );
  }

  Map<String,dynamic> toJson(){
    var map = {
      'id':id,
      'name':name,
      'gender':gender,
      'adult':adult,
      'known_for':knownFor,
      'known_for_department':knownForDepartment,
      'popularity':popularity,
      'profile_path':profilePath,
    };
    return map;
  }
}
