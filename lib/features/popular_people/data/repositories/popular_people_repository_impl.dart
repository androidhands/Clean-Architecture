import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/exceptions.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/failure.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/local_database/app_database.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/network_info/network_info.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/repositories/popular_people_repository.dart';
import 'package:meta/meta.dart';
class PopularPeopleRepositoryImpl implements PopularPeopleRepository{
  final PopularPeopleLocalDataSource? peopleLocalDataSource;
  final PopularPeopleRemoteDataSource? popularPeopleRemoteDataSource;
  final PlatformNetworkInfo? platformNetworkInfo;

  PopularPeopleRepositoryImpl(
      {@required this.peopleLocalDataSource,@required this.popularPeopleRemoteDataSource,@required this.platformNetworkInfo});

  @override
  Future<Either<Failure, List<PopularPeopleEntity>>> gerPopularPeopleRemoteOrLocal(int page, String language) async{
    try{
      bool isConnected = await platformNetworkInfo!.isConnected;
      if(isConnected){
        var popularPeopleList = await popularPeopleRemoteDataSource!.getPopularPeople(page, language);
        List<Insertable<PopularPeopleTableData>>  list = [];

        for(var l in popularPeopleList){
          var insertable = PopularPeopleTableData(id:l.id!
          ,name: l.name!,  popularity: l.popularity!, profilePath: l.profilePath!
              , gender: l.gender!, knownForDepartment: l.knownForDepartment!, adult: l.adult!, knownFor: l.knownFor!
          );
          list.add(insertable);
        }
        await peopleLocalDataSource!.deleteAllPopularPeople();
        await peopleLocalDataSource!.insertAllPopularPeople(list);
        return Right(popularPeopleList);
      }else{
        var popularPeopleList = await peopleLocalDataSource!.getAllPopularPeople();
        return Right(popularPeopleList);
      }
    }on  ServerException catch (e){
    return Left(ServerFailure(e.message));
    }on CacheException catch(e){
      return Left(CacheFailure(e.message));
    }
  }

}