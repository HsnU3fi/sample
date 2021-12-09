import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:espad/pages/users/users.dart';

//==============================================================================
class EditUsers extends StatefulWidget {
  final String itemsUsers;

  const EditUsers({Key? key, required this.itemsUsers}) : super(key: key);

  @override
  _EditUsersState createState() => _EditUsersState();
}

class _EditUsersState extends State<EditUsers> {
  var getItem;
  List items = [];

  String name = '';
  String familyName = '';
  String mobile = '';
  String iDNo = '';
  String address = '';
  String birthDate = '';
  String image = '';
  String imageNew = '';
  List dataUsers = [];
  List userIdList = [];

  @override
  initState() {
    _getItemUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
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
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
          onPressed: _users,
        ),
      ),
      body: Center(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(80, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: name),
                            onChanged: (value) {
                              getItem['name'] = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Family Name :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(40, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: familyName),
                            onChanged: (value) {
                              familyName = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mobile :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(80, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: mobile),
                            onChanged: (value) {
                              mobile = value;
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ID No :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(90, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: iDNo),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              iDNo = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Birth date :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(60, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: birthDate),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              birthDate = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Address :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Flexible(
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.fromLTRB(70, 15, 0, 0),
                          child: TextField(
                            controller: TextEditingController(text: address),
                            onChanged: (value) {
                              address = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black)),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), //flexible
                    ), //container
                  ], //widget
                ),
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
                    InkWell(
                      child: Container(
                          width: 120,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(87, 239, 221, 1),
                              )),
                          child: Image.memory(
                            base64.decode(image),
                            fit: BoxFit.fill,
                            height: 150,
                            width: 120,
                          )),
                      onTap: _choose,
                    ),
                  ], //widget
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: _dataValidation,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      )),
    );
  }

//==============================================================================
  void _users() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Users();
    }));
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
          setState(() {
            getItem = items;
            name = getItem['name'];
            familyName = getItem['family_name'];
            mobile = getItem['mobile'];
            iDNo = getItem['id_no'];
            address = getItem['address'];
            birthDate = getItem['birth_date'];
            image = getItem['image'];
          });
        }
      }
    }
  }

//==============================================================================
  void _choose() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 50.0,
      maxWidth: 50.0,
    );
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      var base64en = base64.encode(imageBytes);
      setState(() {
        image = base64en;
      });
    }
  }

//=============================VALIDATION=======================================
// if (dataUsers.isEmpty) {
  //   _createUser();
  // } else if (dataUsers.isNotEmpty) {
  //   for (var i in dataUsers) {
  //     var decode = jsonDecode(i);
  //     if (decode['id_no'] == iDNo) {
  //       _showSnackBarErrorId(context);
  //     } else {
  //       _createUser();
  //     }
  //   }
  // }

//==============================================================================
  void _dataValidation() async {
    if (name.isNotEmpty &&
        familyName.isNotEmpty &&
        address.isNotEmpty &&
        birthDate.isNotEmpty &&
        iDNo.isNotEmpty &&
        mobile.isNotEmpty) {
      _editUser();
    } else {
      _showSnackBarError(context);
    }
  }

//==============================================================================
  void _editUser() async {
    var dataUsers = [];
    for (var i in items) {
      print(i);
      if (i["ID"] == getItem["ID"]) {
        setState(() {
          i = getItem;
          getItem['name'] = name;
          getItem['family_name'] = familyName;
          getItem['mobile'] = mobile;
          getItem['id_no'] = iDNo;
          getItem['address'] = address;
          getItem['birth_date'] = birthDate;
          getItem["image"] = image;
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
  void _showSnackBarError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Text Field is empty, Please Fill All Data',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
      width: 300,
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
//==============================================================================
//   void _showSnackBarErrorId(BuildContext context) {
//     final snackBar = SnackBar(
//       content: Text('ID Not Valid',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           textAlign: TextAlign.center),
//       behavior: SnackBarBehavior.floating,
//       width: 300,
//       duration: Duration(seconds: 1),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
}
