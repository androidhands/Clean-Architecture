// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../features/popular_people/presentation/pages/popular_people_list_page.dart'
    as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    PopularPeopleListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PopularPeopleListPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(PopularPeopleListRoute.name, path: '/')];
}

/// generated route for
/// [_i1.PopularPeopleListPage]
class PopularPeopleListRoute extends _i2.PageRouteInfo<void> {
  const PopularPeopleListRoute()
      : super(PopularPeopleListRoute.name, path: '/');

  static const String name = 'PopularPeopleListRoute';
}
