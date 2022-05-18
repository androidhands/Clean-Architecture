import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/local_database/data_tables/popular_people.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
part 'app_database.g.dart';
LazyDatabase _connectDatabase(){
  return LazyDatabase(()async{
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(path.join(dbFolder.path,'popular_people.sqlite'));
        return NativeDatabase(file);
      }
  );
}

@DriftDatabase(tables: [PopularPeopleTable])
class AppDatabase extends _$AppDatabase{
  AppDatabase() : super(_connectDatabase());

  @override
  int get schemaVersion => 1;

  Future<List<PopularPeopleTableData>> getAllPopularPeople()async{
    return await select(popularPeopleTable).get();
  }

  Future insertAllPeople(List<Insertable<PopularPeopleTableData>> list) async{
    await batch((batch){
      batch.insertAll(popularPeopleTable, list);});
  }

  Future deleteAllPeople()async{
   await delete(popularPeopleTable).go();
  }
}