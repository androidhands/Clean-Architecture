import 'package:auto_route/annotations.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/pages/popular_people_list_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute> [
      AutoRoute(page: PopularPeopleListPage,initial: true)
    ])
class $AppRouter {}