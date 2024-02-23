import 'dart:math';

import 'package:flutter/material.dart';

class Skills extends StatelessWidget{

  final int index;

  const Skills({super.key, required this.index});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      key: GlobalObjectKey(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Skills',style: TextStyle(fontSize: min((18 / 300 * MediaQuery.sizeOf(context).width), 22),fontWeight: FontWeight.bold,color: Colors.black)),
          ]
      ));
  }

}