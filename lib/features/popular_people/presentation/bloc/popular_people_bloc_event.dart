import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PopularPeopleBlocEvent extends Equatable {
  const PopularPeopleBlocEvent([List props = const[]]):super();
}

class GetPopularPeopleEvent extends PopularPeopleBlocEvent{
  final int? page;
  final String? language;
  const GetPopularPeopleEvent(this.page, this.language);
  @override
  List<Object?> get props =>[page,language];

}