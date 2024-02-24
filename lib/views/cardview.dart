import 'dart:math';

import 'package:flutter/material.dart';

class CardView extends StatelessWidget{

  final String heading;
  final String subHeading;
  final String content;
  final String year;
  final bool align;

  const CardView({super.key, required this.heading, required this.subHeading, required this.content,required this.year, required this.align});

  @override
  Widget build(BuildContext context) {
    bool check = MediaQuery.sizeOf(context).width < 1000 ;
    return InkWell(
      onTap: () {
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 227, 231, 233)
        ),
        alignment: check ? Alignment.center :  align ? Alignment.centerLeft : Alignment.centerRight,
        height: 120,
        width: min((350 / 500 * MediaQuery.sizeOf(context).width), 400),
        child: Row(
          mainAxisAlignment: check ? MainAxisAlignment.center :align ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if(!check && align)
              const SizedBox(width: 30,),
              Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: check ? CrossAxisAlignment.center : align ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Text(content,textAlign: TextAlign.center,maxLines: 2,softWrap: true,style: TextStyle(fontSize: min((15 / 400 * MediaQuery.sizeOf(context).width), 15),fontWeight: FontWeight.bold,color: Colors.black)),
                if(subHeading != '')
                  Text(subHeading,style: TextStyle(fontSize: min((15 / 400 * MediaQuery.sizeOf(context).width), 15),fontWeight: FontWeight.bold,color: Colors.black)),
                SizedBox(height: 10,),
                Text(heading,textAlign: TextAlign.center,maxLines: 2,style: TextStyle(fontSize: min((13 / 400 * MediaQuery.sizeOf(context).width), 13),color: Colors.black)),
                if(check)
                  Text(year,style: TextStyle(fontSize: min((13 / 400 * MediaQuery.sizeOf(context).width), 13),color: Colors.black)),

              ],
            ),
              ),
            if(!check && !align)
              const SizedBox(width: 30,),
        ],)
      ),
    );
  }

}