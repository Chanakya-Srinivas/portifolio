import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/helper.dart';

class About extends StatelessWidget{

  final void Function(String index) onTap;
  final int index;
  
  const About({super.key, required this.onTap, required this.index});

  double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1200) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  @override
  Widget build(BuildContext context) {
    bool check = MediaQuery.sizeOf(context).width > 500;
    return Container(
            height: check ? 300 : 400 ,
            key: GlobalObjectKey(index),
            child: Flex(
              direction: check ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(check)
                  aboutFunc(context,check),
                const CircleAvatar(
                  radius: 80,//(MediaQuery.of(context).size.width
                  backgroundImage: AssetImage('assets/chanakya3.png'),
                ),
                if(!check)
                  aboutFunc(context,check),
              ],
            ),
          );
  }

  Widget aboutFunc(BuildContext context,bool check){
    return Container(
        height: check ? 250 :180,
        width: 300,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: !check ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
            Text('Full Stack Developer', textAlign: check ? TextAlign.left : TextAlign.center, style: TextStyle(fontSize: min((25 / 300 * MediaQuery.sizeOf(context).width), 28),fontWeight: FontWeight.bold,color: Colors.black)),
          ],),
          // Text('Full Stack Developer', style: TextStyle(fontSize: min((25 / 300 * MediaQuery.sizeOf(context).width), 28),fontWeight: FontWeight.bold,color: Colors.black)),
          const SizedBox(
            height: 8,
          ),
          Text('Hello I\'m Chankaya Srinivas Korada. A passionate Full Stack Developer based in Chicago, Illinois.',textAlign: check ? TextAlign.left : TextAlign.center,maxLines: 3, style: TextStyle(fontSize: min((12 / 300 * MediaQuery.sizeOf(context).width), 12),fontWeight: FontWeight.bold,color: Colors.black),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Helper.iconFunc(context, 'Linkedin', 'assets/linkedin.png', 'https://www.linkedin.com/in/chanakya-korada/',onTap),
              Helper.iconFunc(context, 'Git', 'assets/git.png', 'https://github.com/Chanakya-Srinivas',onTap),
              Helper.iconFunc(context, 'Resume', 'assets/resume.png', 'https://drive.google.com/file/d/1A7tETJuuRSvQvO-Eqyyps-PJtTbJeQkw/view?usp=drive_link',onTap),
              Helper.iconFunc(context, 'Leetcode', 'assets/leetcode.png', 'https://leetcode.com/chanakya-korada/',onTap),
            ],
          )
        ],
      ),
    );
  }

}