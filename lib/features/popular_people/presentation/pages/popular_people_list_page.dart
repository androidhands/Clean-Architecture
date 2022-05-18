import 'package:flutter/material.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc_event.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/bloc/popular_people_bloc_state.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/widgets/error_widget.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/presentation/widgets/people_list_widget.dart';
import '../../../../app_injection_container.dart';

class PopularPeopleListPage extends StatefulWidget {

  const PopularPeopleListPage({Key? key}) : super(key: key);


  @override
  State<PopularPeopleListPage> createState() => _PopularPeopleListPageState();
}

class _PopularPeopleListPageState extends State<PopularPeopleListPage> {
  int _counter = 1;

/*
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
*/

  addEventToBloc(BuildContext context){
    BlocProvider.of<PopularPeopleBloc>(context).add(GetPopularPeopleEvent(_counter, "en-US"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PopularPeopleBloc>(),
      child: Builder(
        builder: (context) {
          addEventToBloc(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Squadio'),
              actions: [
                IconButton(onPressed: (){
                  addEventToBloc(context);
                },
                    icon: Icon(Icons.refresh))
              ],
            ),
            body: Container(

              child:BlocBuilder<PopularPeopleBloc,PopularPeopleBlocState>(
                builder: (BuildContext context, state) {
                  if(state is PopularPeopleInitialState){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(state is OnGetPopularPeopleListSuccess){
                    return PeopleListWidget(list: state.list,);
                  }else if(state is OnGetPopularPeopleError){
                    return Center(child: DisplayErrorWidget(message: state.message,valueChanged: addEventToBloc(context),),);
                  }else{
                    return  Center(child: DisplayErrorWidget(message: 'State Error',valueChanged: addEventToBloc(context)),);
                  }
                },

              )

            ),

          );
        }
      ),
    );
  }
}
