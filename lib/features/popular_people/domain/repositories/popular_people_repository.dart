import 'package:dartz/dartz.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/failure.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/server_response.dart';

abstract class PopularPeopleRepository{
  Future<Either<Failure,List<PopularPeopleEntity>>> gerPopularPeopleRemoteOrLocal(int page,String language);
}