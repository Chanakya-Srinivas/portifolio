import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatelessWidget{

  final String year;
  final bool align;

  const DetailView({super.key, required this.year, required this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        alignment: align ? Alignment.centerLeft : Alignment.centerRight,
        height: 120,
        width: 400,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(year,style: TextStyle(fontSize: min((15 / 400 * MediaQuery.sizeOf(context).width), 15),color: Colors.black)),
            ],
          ),
      );
  }

}