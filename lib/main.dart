import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/app_injection_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routing/routing.gr.dart';

void main() async{
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Squadio Task',
        routeInformationParser:  _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_appRouter),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );

  }
}

