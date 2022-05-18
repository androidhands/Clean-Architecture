import 'package:squadio_flutter_task_abdelhamid_ahmed/core/errors/failure.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/usecases/popular_people_usecases.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc_event.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class PopularPeopleBloc extends Bloc<PopularPeopleBlocEvent,PopularPeopleBlocState>{
  final GetAllPopularPeopleUseCase? popularPeopleUseCase;

  PopularPeopleBloc({@required this.popularPeopleUseCase}) : super(PopularPeopleInitialState());


  @override
  Stream<PopularPeopleBlocState> mapEventToState(PopularPeopleBlocEvent event) async* {
    if (event is GetPopularPeopleEvent) {

      yield PopularPeopleInitialState();
      final failureOrList = await popularPeopleUseCase!(PopularPeopleParams(
      page: event.page,language: event.language
      ));
      yield failureOrList.fold(
              (failure)=>OnGetPopularPeopleError(_mapFailureToMessage(failure))
          , (list)=>OnGetPopularPeopleListSuccess(list));
    }
  }
}


String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    case CacheFailure:
      return (failure as CacheFailure).message;
    default:
      return 'Unexpected error';
  }
}