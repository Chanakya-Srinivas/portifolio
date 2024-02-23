import 'dart:math';

import 'package:flutter/material.dart';

class Projects extends StatefulWidget{

  final int index;
  final void Function(String index) onTap;
  
  const Projects({super.key, required this.index, required this.onTap});

  @override
  _Projects createState() => _Projects();

}

class _Projects extends State<Projects>{

  List<bool> onHover = List<bool>.filled(4, false);

  Widget projectCard(String image, String projectName, String languages, String url, double radius, double screenWidth,int index){
    return InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: () => widget.onTap(url),
          onHover: (value) {
            setState(() {
              onHover[index] = value;
            });
          },
          child:Container(
            alignment: Alignment.center,
            width: screenWidth<600 ? min(3 * screenWidth/4,350) : screenWidth<900 ? screenWidth * 0.4 : screenWidth*0.22,
            height: max(150, min(2 * screenWidth/3 ,200)),
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: onHover[index] ? const Color.fromARGB(255, 205, 209, 211) : const Color.fromARGB(255, 227, 231, 233)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundImage: AssetImage(image),
                    ),
                    Text(projectName,textAlign: TextAlign.center,softWrap: true,style: TextStyle(fontSize: min((15 / 400 * screenWidth), 15),fontWeight: FontWeight.bold,color: Colors.black)),
                    SizedBox(height: 10,),
                    Text(languages,textAlign: TextAlign.center,maxLines: 2,style: TextStyle(fontSize: min((13 / 400 * screenWidth), 13),color: Colors.black)),
                    ],
                ),
            )
        );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: screenWidth<600 ? max(770, min(17 * screenWidth/5 ,1000)) : screenWidth<900 ? 550 : 300,
      key: GlobalObjectKey(widget.index),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Projects',style: TextStyle(fontSize: min((15 / 300 * screenWidth), 20),fontWeight: FontWeight.bold,color: Colors.black)),
          const SizedBox(height: 30,),
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: screenWidth < 900 ? Axis.vertical : Axis.horizontal,
            children: [
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: screenWidth < 600 ? Axis.vertical : Axis.horizontal,
                children: [
                  projectCard('assets/fingertips.png', 'FingerTips', 'Flutter, MySQL', 'https://github.com/Chanakya-Srinivas/FingerTips', 50, screenWidth,0),
                  SizedBox(height: screenWidth < 600 ? 30 : null,width: screenWidth < 600 ? null : 30,),
                  projectCard('assets/timetable.png', 'Timetable Generator', 'Spring Framework, Java, JavaScript, Bootstrap', 'https://github.com/Chanakya-Srinivas/FingerTips',50,screenWidth,1),
                ],
              ),
              SizedBox(height: screenWidth < 900 ? 30 : null,width: screenWidth < 900 ? null : screenWidth*0.005,),
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: screenWidth < 600 ? Axis.vertical : Axis.horizontal,
                children: [
                  projectCard('assets/database.png', 'SQL Data Storage Management System', 'C, Data Structures & Algorithms', 'https://github.com/Chanakya-Srinivas/FingerTips',50,screenWidth,2),
                  SizedBox(height: screenWidth < 600 ? 30 : null,width: screenWidth < 600 ? null : 30,),
                  projectCard('assets/timetable.png', 'projectName', 'languages', 'url',50,screenWidth,3),
                ],
              ),
              const SizedBox(height: 30,),
            ],
          )
        ],
      ),
    );
  }

}