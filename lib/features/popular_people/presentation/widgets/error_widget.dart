import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayErrorWidget extends StatelessWidget{
  final String? message;
  final ValueChanged? valueChanged;

  const DisplayErrorWidget({Key? key,required this.message,required this.valueChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(message!,style: GoogleFonts.reemKufi(fontSize: 16),),
          MaterialButton(onPressed: (){
            valueChanged!(context);
          },
          child:  Text('Try Again',style: GoogleFonts.reemKufi(fontSize: 12),),
          color: Colors.orange,)
        ],
      ),
    );
  }

}