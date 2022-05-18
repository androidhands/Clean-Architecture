import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/models/known_for_model.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/known_for_entity.dart';

class PopularPeopleTable extends Table{
  IntColumn get id=> integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get gender => integer()();
  BoolColumn get adult => boolean()();
  TextColumn get knownFor => text().map(const CustomConverter())();
  TextColumn get knownForDepartment => text()();
  RealColumn get popularity => real()();
  TextColumn get profilePath => text()();

}

class CustomConverter extends TypeConverter<dynamic, String> {
  const CustomConverter();

  @override
  dynamic mapToDart(String? fromDb) {
    var m = jsonDecode(fromDb!);
    dynamic posts = List<KnownForEntity>.from(m.map((model)=> KnownForModel.fromJson(model)));
   return posts;
  }

  @override
  String? mapToSql(dynamic value) {
    return jsonEncode(value);
  }



}
