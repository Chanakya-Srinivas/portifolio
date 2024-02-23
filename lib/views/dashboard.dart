
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/about.dart';
import 'package:flutter_application_1/views/contact.dart';
import 'package:flutter_application_1/views/experience.dart';
import 'package:flutter_application_1/views/mydrawer.dart';
import 'package:flutter_application_1/views/projects.dart';
import 'package:flutter_application_1/views/skills.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Dashboard extends StatelessWidget{

  const Dashboard({super.key});

//   @override
//   _Dashboard_2 createState() => _Dashboard_2();
// }

// class _Dashboard_2 extends State<Dashboard>  {

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _moveTo(int index){
    GlobalObjectKey key = GlobalObjectKey(index);
    Scrollable.ensureVisible(key.currentContext!,
      duration: Duration(seconds: 1),
      alignment: .05, // 0 mean, scroll to the top, 0.5 mean, half
      curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController ctr = ScrollController();
    bool check = MediaQuery.sizeOf(context).width <= 500;
    // dataKey.
    return 
    // MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home:
       Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          // leading: MediaQuery.sizeOf(context).width <= 500 ? null :Text('Chanakya.Dev'),
          // backgroundColor: check ? Colors.transparent :Colors.white,
          // elevation: 0.0,
          centerTitle: true,
          actions:check ? null :[
            
            const Spacer(
              flex: 8,
            ),
            TextButton(
              onPressed: () {
                // ctr.scrollTo(
                //   index: 0,
                //   duration: const Duration(milliseconds: 1000),
                  // curve: Curves.bounceIn);
                //ctr.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                _moveTo(0);
              },  
              child: Text('About',style: TextStyle(color: const Color.fromARGB(255, 72, 61, 61),fontWeight: FontWeight.bold),),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // ctr.scrollTo(
                //   index: 1,
                //   duration: const Duration(milliseconds: 1000),
                //   curve: Curves.bounceIn);
                _moveTo(2);
              }, 
              child: Text('Experience',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // ctr.scrollTo(
                //   index: 2,
                //   duration: const Duration(milliseconds: 1000),
                //   curve: Curves.bounceIn);
                _moveTo(3);
              }, 
              child: Text('Projects',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
              // Uri emailLaunchUri = Uri(
              //   scheme: 'mailto',
              //   path: 'ckorada@hawk.iit.edu',
              // );
              // _launchURL(emailLaunchUri.toString());
              _moveTo(4);
            }, 
              child: const Text('Contact',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            const Spacer(),
          ],
        ),
        drawer: MediaQuery.sizeOf(context).width > 500 ? null : MyDrawer(onTap: _launchURL,onTapMove: _moveTo,),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(5, 
            (index) => index == 0 ? About(onTap: _launchURL,index: index,) : 
            index==1 ? Skills(index: index) : 
            index==2 ? Experience(index: index) : (index==3)? Projects(index: index,onTap: _launchURL,) : Contact(onTap: _launchURL,index : index)),
          ),
        ),
        //  ListView.builder(
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return index == 0 ? About(onTap: _launchURL,index: index,) : index==1 ? Experience(index: index) : Projects(index: index,);
        //   }
        // ),
        // body: CustomScrollView(
        //   slivers: [
        //     SliverToBoxAdapter(child: About(onTap: _launchURL)),
        //     const Experience(),
        //     const Projects(),
        //   ],
        // ),
        // body : ScrollablePositionedList.builder(
        //   itemScrollController: ctr,
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return index == 0 ? About(onTap: _launchURL) : index==1 ? const Experience() : const Projects();
        //   }),
          
        // body : Center(
        //   child: ListView(
        //     children: [
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       About(onTap: _launchURL),
        //       const Experience(),
        //       // const Projects(),
        //     ],
        //   ),
        // ),
      // ),
    );
  }
}