import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/helper.dart';

class Contact extends StatelessWidget{

  final void Function(String index) onTap;
  final int index;
  
  const Contact({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      key: GlobalObjectKey(index),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 227, 231, 233)
        ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 2 * MediaQuery.sizeOf(context).width / 3,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        Text('Chankaya Srinivas Korada', style: TextStyle(fontSize: min((15 / 500 * MediaQuery.sizeOf(context).width), 15),color: Colors.black),),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        const Icon(Icons.mail,size: 15,),
                        const SizedBox(width: 10,),
                        InkWell(
                            child: Text("ckorada@hawk.iit.edu",style: TextStyle(fontSize: min((12 / 500 * MediaQuery.sizeOf(context).width), 12),decoration: TextDecoration.underline,),),
                            onTap: () {
                                Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'ckorada@hawk.iit.edu',
                                );
                                onTap(emailLaunchUri.toString());
                              }, 
                        ),
                        Text(",",style: TextStyle(fontSize: min((12 / 500 * MediaQuery.sizeOf(context).width), 12),),),
                      ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20,),
                        const Icon(Icons.phone,size: 15,),
                        const SizedBox(width: 10,),
                        Text("(314) 709-3315",style: TextStyle(fontSize: min((12 / 500 * MediaQuery.sizeOf(context).width), 12),),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width/3,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Helper.iconFunc(context, 'Linkedin', 'assets/linkedin.png', 'https://www.linkedin.com/in/chanakya-korada/',onTap),
                  const SizedBox(width: 20,)
                ],)
              )
            ],
          ),
          Text('Ⓒ Developed by Chanakya Srinivas Korada',style: TextStyle(fontSize: min((10 / 500 * MediaQuery.sizeOf(context).width), 10)),),
        ],
      ),
    );
  }

}