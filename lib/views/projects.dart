import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/helper.dart';

class Projects extends StatefulWidget{

  final int index;
  final void Function(String index) onTap;
  
  const Projects({super.key, required this.index, required this.onTap});

  @override
  _Projects createState() => _Projects();

}

class _Projects extends State<Projects>{

  List<bool> onHover = List<bool>.filled(4, false);

  Widget projectCard(String image, String image2, String projectName, String projectDescription, String languages, String url, double radius, double screenWidth,int index){
    return InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: () {
            showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                scrollable: true,
                shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(20.0))),
                title:Row(children: [
                    ImageIcon(AssetImage(image2)),
                    SizedBox(width: 10,),
                    Container(
                      width: min(MediaQuery.of(context).size.width/2,400),
                      child: Flexible(child: Text(projectName,maxLines: 2,)),
                    )
                    
                  ],
                ),
                content: Builder(
                  builder: (context) {
                    return SizedBox(
                      height: min(MediaQuery.of(context).size.height/2,110),
                      width: min(MediaQuery.of(context).size.width/2,400),
                      child: SingleChildScrollView(
                        child: Text(projectDescription,maxLines: 20,),
                      ),
                    );
                  },
                ),
                actions: [
                  Helper.iconFunc(context, 'Git', 'assets/git.png', url, widget.onTap),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],);
                // widget.onTap(url);
                },
              );
            },
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
                  projectCard('assets/fingertips.png', 'assets/fingertips2.png', 'FingerTips' , 'Fingertips is a go-to destination for staying informed and up-to-date with the latest news and happenings around the world. With a sleek and intuitive design, this app offers a seamless experience for users who crave real-time information tailored to their interests.', 'Flutter, MySQL', 'https://github.com/Chanakya-Srinivas/FingerTips', 50, screenWidth,0),
                  SizedBox(height: screenWidth < 600 ? 30 : null,width: screenWidth < 600 ? null : 30,),
                  projectCard('assets/timetable.png', 'assets/timetable2.png', 'Timetable Generator', 'Designed and implemented a web application that replaces the manual creation of class and faculty timetables with a smart and efficient method. The admin can log in, manage faculty load, align subjects based on experience, and generate timetables they can also schedule events based on available time slots for faculty and students.', 'Spring Framework, Java, JavaScript, Bootstrap', 'https://github.com/Chanakya-Srinivas/FingerTips',50,screenWidth,1),
                ],
              ),
              SizedBox(height: screenWidth < 900 ? 30 : null,width: screenWidth < 900 ? null : screenWidth*0.005,),
              Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: screenWidth < 600 ? Axis.vertical : Axis.horizontal,
                children: [
                  projectCard('assets/database.png', 'assets/database2.png', 'SQL Data Storage Management System', 'Implemented an SQL Data Storage Manager capable of maintaining tables in a file using a B+ tree. It can access records of a table through a buffer pool and perform basic SQL operations on a table.', 'C, Data Structures & Algorithms', 'https://github.com/Chanakya-Srinivas/FingerTips',50,screenWidth,2),
                  SizedBox(height: screenWidth < 600 ? 30 : null,width: screenWidth < 600 ? null : 30,),
                  projectCard('assets/timetable.png', 'assets/timetable2.png', 'projectName', '', 'languages', 'url',50,screenWidth,3),
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