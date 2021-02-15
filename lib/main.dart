import 'package:shared_preferences/shared_preferences.dart';
import 'package:ver2/Components/Backgroundcolorr.dart';
import 'package:ver2/Screens/AddRemarks.dart';
import 'package:ver2/Screens/CaseSearchScreen.dart';
import 'package:ver2/Screens/CaseStatus.dart';
import 'package:ver2/Screens/LoginScreen.dart';
import 'package:ver2/Screens/MyCase.dart';
import 'package:ver2/Screens/StartPage.dart';
import 'package:ver2/Screens/detailsScreen.dart';
import 'package:flutter/material.dart';


import 'Components/SplashScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogged = (prefs.getBool('isLogged') ?? false) ;

  var home;
  if(isLogged)
    home = StartPage();
  else
    home = SplashScreen() ;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.id,
      routes:{
        MyCase.id: (context) => MyCase(),
        CaseSearchScreen.id: (context) => CaseSearchScreen(),
        CaseStatus.id: (context) => CaseStatus(),
        SplashScreen.id: (context) => SplashScreen(),
        StartPage.id: (context) => StartPage(),
        DetailsScreen.id: (context) => DetailsScreen(),
        AddRemarks.id: (context) => AddRemarks(),
      },
    );
  }
}


