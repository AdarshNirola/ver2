import 'dart:async';

import 'package:ver2/Screens/LoginScreen.dart';
import 'package:ver2/Screens/StartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/LoginScreen.dart';
class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async{
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => StartPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Background1.png"),
                    fit: BoxFit.cover
                )
            ),
          ),

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [

                    Container(
                      child: Image.asset("assets/govtofsikkim1.png"),
                      height: 160,
                      width: 160,
                    ),

                    Text("Government Of Sikkim", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),),
                    Text("CCMS",style: TextStyle(
                      fontSize: 12,
                    ),),

                    SizedBox(height: 60,),

                    Container(
                      height: 80,
                      width: 80,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(29),
                        gradient: LinearGradient(

                            colors: [Colors.lightBlueAccent,Colors.grey],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),),
                      child: Center(
                        child: FlatButton(

                          child: Icon(Icons.book,size: 30,),
                        ),
                      ),
                    ),

                    Text("""
            Court Case
    Management System"""),

                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Container(
                                child: Image.asset("assets/nicLogo.jpg"),
                                height: 100,
                                width: 100,
                              ),

                              Container(
                                child: Image.asset("assets/digital_india.png"),
                                height: 100,
                                width: 100,
                              ),

                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
