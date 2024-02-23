import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/cardview.dart';
import 'package:flutter_application_1/views/detailview.dart';

class Experience extends StatelessWidget{

  final int index;

  const Experience({super.key, required this.index});

  Widget createOddRow(BuildContext context, bool check, String image, String heading,
  String subHeading, String year, String content1, String content2){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: !check ? [
          ImageIcon(AssetImage(image),size:  min((35 / 400 * MediaQuery.sizeOf(context).width), 50),),
          SizedBox(width: min((20 / 500 * MediaQuery.sizeOf(context).width), 40),),
          CardView(heading: heading, 
            subHeading: subHeading, 
            content: content1,
            year: year, align: false,),
        ] : [
           CardView(heading: heading, 
            subHeading: subHeading, 
            content: content2,
            year: year, align: false,),
          const SizedBox(width: 20,),
          ImageIcon(AssetImage(image),size: 50,),
          const SizedBox(width: 20,),
          DetailView(year: year,align: true,),
      ],);
  }

  Widget createEvenRow(BuildContext context, bool check, String image, String heading,
  String subHeading, String year, String content1, String content2){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: check ? 
        [
          DetailView(year: year, align: false,),
          const SizedBox(width: 20,),
          ImageIcon(AssetImage(image),size: min((35 / 400 * MediaQuery.sizeOf(context).width), 50),),
          const SizedBox(width: 20,),
          CardView(heading: heading, 
            subHeading: subHeading,
            content: content1,
            year: year, align: true,),
        ] : [
          ImageIcon(AssetImage(image),size: min((35 / 400 * MediaQuery.sizeOf(context).width), 50),),
          SizedBox(width: min((20 / 500 * MediaQuery.sizeOf(context).width), 40),),
          CardView(heading: heading, 
            subHeading: subHeading,
            content: content2,
            year: year, align: true,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool check = MediaQuery.sizeOf(context).width>1000;
    return Container(
      // height: 300,
      key: GlobalObjectKey(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Education & Experience',style: TextStyle(fontSize: min((18 / 300 * MediaQuery.sizeOf(context).width), 22),fontWeight: FontWeight.bold,color: Colors.black)),
            const SizedBox(height: 30,),
            createOddRow(context, 
             check, 'assets/education.png',
             'Illinois Institue of Technology, Chicagio, IL',
              '', 'Jan 2023 - Dec 2024', 
              'Masters in Computer Science',
              'Master of Science in Computer Science'),
            const SizedBox(height: 30,),
            createEvenRow(context, check,
             'assets/work.png', 'Infosys', 
             'Banglore, India', 'Oct 2020 - Nov 2022', 
             'Specialist Programmer', 'Specialist Programmer'),
            const SizedBox(height: 30,),
            createOddRow(context, check,
             'assets/education.png', 
             'Gayatri Vidya Parishad College of Engineering', 
             'Visakhapatanam, India', 'Aug 2016 - Sep 2020', 
             'B.Tech in Computer Science',
             'Batchelors of Technology in Computer Science'),
            const SizedBox(height: 30,),

          ]
      ));
  }

}