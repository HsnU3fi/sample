import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smapleespad/pages/users/users.dart';
//==============================================================================

class CheckUsers extends StatefulWidget {
  final String itemsUsers;

  const CheckUsers({Key? key, required this.itemsUsers}) : super(key: key);

  @override
  _CheckUsersState createState() => _CheckUsersState();
}

class _CheckUsersState extends State<CheckUsers> {
  var getItem;
  List items=[];
  String image = '';


  @override
  void initState() {
    _getItemUser();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Espad",
            style: GoogleFonts.pacifico(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Name :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text("${getItem['name']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                      width: 80,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['name'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Family Name :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80,
                      child: Text("${getItem['family_name']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['family_name'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Mobile :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      child: Text("${getItem['mobile']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['mobile'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("ID No :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80,
                      child: Text("${getItem['id_no']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['id_no'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Birth Date :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80,
                      child: Text("${getItem['birth_date']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['birth_date'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Address :",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80,
                      child: Text("${getItem['address']}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold) // has impact
                          ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            alignment: Alignment.centerRight,
                            iconSize: 20,
                            color: Colors.black,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                getItem['address'] = "";
                              });
                            }),
                        IconButton(
                            alignment: Alignment.centerLeft,
                            iconSize: 20,
                            color: Colors.green,
                            icon: Icon(Icons.check_circle),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Pic :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                   Container(
                            width: 110,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(87, 239, 221, 1),
                                )),
                            child: Image.memory(
                              base64.decode(getItem['image']),
                              fit: BoxFit.fill,
                              height: 150,
                              width: 120,
                            )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              alignment: Alignment.centerRight,
                              iconSize: 20,
                              color: Colors.black,
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  getItem['image'] = "";
                                });
                              }),
                          IconButton(
                              alignment: Alignment.centerLeft,
                              iconSize: 20,
                              color: Colors.green,
                              icon: Icon(Icons.check_circle),
                              onPressed: () {}),
                        ],
                      ),

                    ], //widget
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50, left: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    width: 110,
                    child: RaisedButton(
                      color: Colors.red,
                      splashColor: Colors.black,
                      child: Text(
                        'Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: _users,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    width: 110,
                    child: RaisedButton(
                      color: Color.fromRGBO(87, 239, 221, 1),
                      splashColor: Colors.black,
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed:_createUser,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
//==============================================================================
  void _getItemUser() async {
    final prefs = await SharedPreferences.getInstance();
    final getData = prefs.getString('dataUsers');

    if (getData != null) {
      var decode = jsonDecode(getData);
      setState(() {
        items = decode;
      });
      for (var items in decode) {
        if (items['ID'] == widget.itemsUsers) {
          print("items");
          print(items);
          setState(() {
            getItem = items;
          });
        }
      }
    }
  }

//==============================================================================
  void _createUser() async {
    var dataUsers=[];
    for(var i in items){
      print(i);
      if(i["ID"]==getItem["ID"]){
        setState(() {
          i=getItem;
        });
      }
      dataUsers.add(i);
    }
    String encodeData = jsonEncode(dataUsers);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('dataUsers', encodeData.toString());
    _showSnackBarSuccess(context);
  }
//==============================================================================
  void _users() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Users();
    }));
  }
//==============================================================================
  void _showSnackBarSuccess(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Success',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      width: 300,
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Future.delayed(Duration(milliseconds: 1200), () {
      this._users();
    });
  }

}
