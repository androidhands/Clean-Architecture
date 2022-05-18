import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/local_database/app_database.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/network_info/network_info.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/utils/app_constants.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/data/repositories/popular_people_repository_impl.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/repositories/popular_people_repository.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/usecases/popular_people_usecases.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc.dart';

final sl = GetIt.instance;

void init(){


  //bloc
  sl.registerFactory(() => PopularPeopleBloc(popularPeopleUseCase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllPopularPeopleUseCase(sl()));

  // repositories
  sl.registerLazySingleton<PopularPeopleRepository>(() => PopularPeopleRepositoryImpl(peopleLocalDataSource: sl(), popularPeopleRemoteDataSource: sl(), platformNetworkInfo: sl()));


  //local data source
  sl.registerLazySingleton<PopularPeopleLocalDataSource>(() => PopularPeopleLocalDataSourceImpl(sl()));

  //remote data source
  sl.registerLazySingleton<PopularPeopleRemoteDataSource>(() => PopularPeopleRemoteDataSourceImpl(sl(),AppConstants.baseUrl));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() =>DataConnectionChecker());
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton<PlatformNetworkInfo>(() => NetworkInfoImpl(sl()));
}