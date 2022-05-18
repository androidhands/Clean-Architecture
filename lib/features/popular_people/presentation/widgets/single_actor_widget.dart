
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/core/utils/app_constants.dart';
import 'package:squadio_flutter_task_abdelhamid_ahmed/features/popular_people/domain/entities/popular_people_entity.dart';

class SingleActorWidget extends StatelessWidget{
  final PopularPeopleEntity? popularPeopleEntity;

  const SingleActorWidget({Key? key, this.popularPeopleEntity}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: const EdgeInsets.all(3),
     padding: const EdgeInsets.all(8),
     height: 400,

     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
     child: Column(
       children: [
         Image.network('${AppConstants.imageUrl}${popularPeopleEntity!.profilePath}',height: 300,errorBuilder: ( context,  exception,  stackTrace){
           return Image.asset('assets/squadio.jpg',height: 300,);
         },),
         const SizedBox(height: 10,),
         Text(popularPeopleEntity!.name!,style: GoogleFonts.notoKufiArabic(fontSize: 16),),
         const SizedBox(height: 5,),
         Text('Popularity ${popularPeopleEntity!.popularity!.toStringAsFixed(1)}',style: GoogleFonts.notoKufiArabic(fontSize: 16),),
       ],
     ),
   );
  }
  
}