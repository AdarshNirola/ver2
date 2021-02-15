import 'package:ver2/Components/navdrawer.dart';
import 'package:ver2/Screens/CaseSearchScreen.dart';
import 'package:ver2/Screens/CaseStatus.dart';
import 'package:ver2/Screens/MyCase.dart';
import 'package:ver2/Screens/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import 'CaseList.dart';

class StartPage extends StatefulWidget {
  static String id = "StartPage";

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin{
  TabController _controller;
  int _selectedIndex = 0;

  TabBar get _tabBar => TabBar(
    indicatorColor: Colors.black,

    onTap: (index){
      //swipe is also a tap but now it isnt because of the controller
    },
    controller: _controller,
    tabs: list,
    labelColor: Colors.black,
  );

  List<Widget> list = [
    Tab(text: """
    My
   Case""",icon: new Icon(MdiIcons.human,color: Colors.black)),
    Tab(text: """
    Case 
   Search""",icon: new Icon(MdiIcons.briefcaseSearch,color: Colors.black)),
    Tab(text: """
    Case 
   Status""",icon: new Icon(MdiIcons.listStatus,color: Colors.black)),
    Tab(text: """
    Case 
     List""",icon: new Icon(MdiIcons.clipboardList,color: Colors.black)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);
    _controller.addListener(() {
      _selectedIndex = _controller.index;
    });
    print("Selected Index: " + _controller.index.toString());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromRGBO(167, 208, 251, 1),
          actions: [

            Image.asset("assets/scaleIMG.png",fit: BoxFit.cover,height: 35,)


          ],
          title: Text("CCMS",
            style: TextStyle(color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color:  Color.fromRGBO(167, 208, 251, 1),
                child: _tabBar
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            MyCase(),
            CaseSearchScreen(),
            CaseStatus(),
            CaseList(),
          ],
        ),

      ),
    );
  }
}
