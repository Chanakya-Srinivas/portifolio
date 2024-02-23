import 'dart:math';

import 'package:flutter/material.dart';

class Helper{

  static   Widget iconFunc(BuildContext context, String tooltip,String image,String url, void Function(String index) onTap){
    return IconButton(
        iconSize: min((30 / 300 * MediaQuery.sizeOf(context).width), 30),
        tooltip: tooltip,
        icon: ImageIcon(AssetImage(image)),
        onPressed: ()=>onTap(url),
      );
  }

}