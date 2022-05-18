import 'package:flutter/cupertino.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/widgets/single_actor_widget.dart';

class PeopleListWidget extends StatelessWidget{
  final List<PopularPeopleEntity>? list;

  const PeopleListWidget({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView(
        children: list!.map((e) =>  SingleActorWidget(popularPeopleEntity: e,)).toList(),
      )
    );
  }

}