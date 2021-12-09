import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smapleespad/images/images.dart';
import 'package:smapleespad/pages/users/users.dart';
import 'dart:io' as Io;


//==============================================================================
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List dataUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleSplash();
    _createUserDefault();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.white,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.white,
          ])),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Image.asset(
                  'assets/images/logo-espad.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sample Espad",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.macondo(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )),
            ],
          )
        ],
      ),
    ));
  }

//==============================================================================
  handleSplash() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Users()));
  }
//==============================================================================
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
//==============================================================================
  void _createUserDefault() async {
    print("img64");

    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();




    Map data = {
      "ID":getRandomString(10),
      "name": "John",
      "family_name": "Stewart",
      "address": "manchester",
      "birth_date": "1991/01/13",

      "mobile": "09052233568",
      "id_no": "4980011111",
      "image":Images().black,
      "deleted": false
    };
    Map data1 = {
      "ID":getRandomString(10),
      "name": "Jack",
      "family_name": "Stewart",
      "address": "New York",
      "birth_date": "1991/01/13",
      "mobile": "09101687627",
      "id_no": "4980011112",
      "image": Images().eminem,
      "deleted": false
    };
    Map data2 = {
      "ID":getRandomString(10),
      "name": "Natalia",
      "family_name": "Gomez",
      "address": "manchester",
      "birth_date": "1986/06/06",
      "mobile": "09211890565",
      "id_no": "8463830885",
      "image": Images().miss,
      "deleted": false
    };
    String encodeData = jsonEncode(data);
    String encodeData1 = jsonEncode(data1);
    String encodeData2 = jsonEncode(data2);
    dataUsers.add(encodeData);
    dataUsers.add(encodeData1);
    dataUsers.add(encodeData2);
    preferences.setString('dataUsers', dataUsers.toString());
  }
}
