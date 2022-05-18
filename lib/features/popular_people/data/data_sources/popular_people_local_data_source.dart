import 'package:drift/drift.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/exceptions.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/local_database/app_database.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/models/popular_people_model.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';

abstract class PopularPeopleLocalDataSource{
  Future<List<PopularPeopleEntity>> getAllPopularPeople();
  Future deleteAllPopularPeople();
  Future insertAllPopularPeople(List<Insertable<PopularPeopleTableData>> popularPeopleList);

}

class PopularPeopleLocalDataSourceImpl implements PopularPeopleLocalDataSource{
  final AppDatabase appDatabase;
  PopularPeopleLocalDataSourceImpl(this.appDatabase);


  @override
  Future deleteAllPopularPeople() async {
    return await appDatabase.deleteAllPeople();
  }

  @override
  Future<List<PopularPeopleEntity>> getAllPopularPeople()async {
    var list = await appDatabase.getAllPopularPeople();
    if(list.isNotEmpty){
      return Future.value(list.map((popularPeople){
        return PopularPeopleModel.fromJson(popularPeople.toJson());}).toList());
    }else{
      throw CacheException('No Data Saved, Please try to connect your device with network to reload popular people');
    }
  }

  @override
  Future insertAllPopularPeople(List<Insertable<PopularPeopleTableData>> popularPeopleList) async{
    return await appDatabase.insertAllPeople(popularPeopleList);
  }



}