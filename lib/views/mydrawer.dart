import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{

  final void Function(String index) onTap;
  final void Function(int index) onTapMove;
  
  const MyDrawer({super.key, required this.onTap, required this.onTapMove});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 160,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text('Chanakya.dev',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),)
          ),
          ListTile(
            onTap: () { 
              onTapMove(0);
              Navigator.pop(context);
            }, 
            title: const Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: () { 
              onTapMove(2);
              Navigator.pop(context);
            },
            title: const Text('Experience',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: () { 
              onTapMove(3);
              Navigator.pop(context);
            }, 
            title: const Text('Projects',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          ListTile(
            onTap: () {
              onTapMove(4);
              Navigator.pop(context);
            }, 
            title: const Text('Contact',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

}