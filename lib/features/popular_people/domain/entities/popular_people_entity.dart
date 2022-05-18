import 'package:equatable/equatable.dart';

class PopularPeopleEntity extends Equatable{
  final int? id;
  final String? name;
  final int? gender;
  final bool? adult;
  final dynamic knownFor;
  final String? knownForDepartment;
  final double? popularity;
  final String? profilePath;

  const PopularPeopleEntity(this.id, this.name, this.gender, this.adult, this.knownFor, this.knownForDepartment, this.popularity, this.profilePath);

  @override
  List<Object?> get props => [id!,name!,gender!,knownFor,knownForDepartment!,popularity!,profilePath!];

}