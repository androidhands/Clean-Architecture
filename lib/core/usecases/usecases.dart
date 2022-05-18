import 'package:dartz/dartz.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/failure.dart';

abstract class UseCases<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}

