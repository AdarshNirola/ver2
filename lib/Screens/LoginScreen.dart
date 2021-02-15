import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ver2/Screens/ModelLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ver2/Screens/StartPage.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences sharedPreferences;

  bool apiCall = false;


  String dialogHead = "";
  String dialogMessage = "";

  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();



  Future<ModelLogin> createAlbum(String username,String password) async {
    var response = await http.post(
      Uri.https('731fb6922eda.ngrok.io', 'login'),
      headers: {
        "Accept": "application/json"
        },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if(response.statusCode == 200)
    {
      Verify(response);
    }
  }
  @override
  void initState() {
    super.initState();

  }

  void submit() async {
    progressIndicator(true);
    var response ;
    try{
      String username=_user.text;
      String password = _password.text;
      response = await createAlbum(username,password);
    }
    catch(e){
      print("Catch error");
    }
    progressIndicator(false);

    if (response.statusCode == 200) {
       
      }
     else {
      setState(() {
        dialogHead = "Connection Error";
        dialogMessage = "Check connection and try again";
      });
      showAlertDialog();
    }
  }

  @override
  void onSuccess() async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogged", true);
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => StartPage()
    ));

  }

  @override
  void onDialogPressed() {
      Navigator.pop(context) ;
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.purple,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.purpleAccent,
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text(
                'CCMS',
              ),
            ),
            body: LayoutBuilder(
                  builder:
                      (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                        BoxConstraints(minHeight: viewportConstraints.maxHeight),
                        child: Container(
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Colors.purpleAccent,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.30,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor:
                                          Theme
                                              .of(context)
                                              .primaryColor,
                                          radius: 40,
                                          child: Icon(
                                            Icons.person,
                                            size: 50,
                                          ),
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      ),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          autocorrect: true,
                                          controller: _user,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your username',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                              borderSide: BorderSide(
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
                                                width: 3,
                                              ),
                                            ),
                                            prefixIcon: IconTheme(
                                              data: IconThemeData(
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
                                              ),
                                              child: Icon(Icons.email),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          autocorrect: true,
                                          controller: _password,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: 'Enter your password',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20),
                                              borderSide: BorderSide(
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
                                                width: 3,
                                              ),
                                            ),
                                            prefixIcon: IconTheme(
                                              data: IconThemeData(
                                                color: Theme
                                                    .of(context)
                                                    .primaryColor,
                                              ),
                                              child: Icon(Icons.lock),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Center(
                                            child: FlatButton(
                                              onPressed: () {
                                                submit();
                                                },
                                              padding: EdgeInsets.all(16),
                                              color: Theme
                                                  .of(context)
                                                  .primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    'LOGIN',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    size: 25,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )//asdad
          ),
        )
    );
  }
  void showAlertDialog() {
    showDialog(
      context: context,
      child: new AlertDialog(
        title: Text(dialogHead),
        content: Text(dialogMessage),
        actions: [
          new FlatButton(
              child: const Text("Ok"),
              onPressed: onDialogPressed
          ),
        ],
      ),
    );
  }
  void progressIndicator(bool status) {
    // If it was calling the api and now it's false
    // that means the request has completed , and so , close the dialog
    if (apiCall == true && status == false)
      Navigator.pop(context);
    setState(() {
      apiCall = status;
    });
    showIndicator();
  }
  void showIndicator() {
    if (apiCall) {
      showDialog(
        context: context,
        barrierDismissible: false,
        child: new Dialog(
          child: Container(
              height: 100.0,
              child: new Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new CircularProgressIndicator(),
                    new Text("Loading"),
                  ],
                ),
              )),
        ),
      );
    }
  }

  void Verify(http.Response response) {
    print("YA pani bhayo");
    var jsonResponse = jsonDecode(response.body);
    var status = jsonResponse['status'];
    if (status == 'failure') {
      print("Status:failed");
      showAlertDialog();
      print(response.body) ;
    } else {
      onSuccess();

    }
  }


}
