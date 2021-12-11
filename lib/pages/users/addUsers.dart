import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:espad/images/images.dart';
import 'package:espad/pages/users/users.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

//==============================================================================
class AddUsers extends StatefulWidget {
  @override
  _AddUsersState createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  String name = '';
  String familyName = '';
  String mobile = '';
  String iDNo = '';
  String address = '';
  String birthDate = '';
  List dataUsers = [];
  List userIdList = [];
  String image = Images().imgdefault;
  late Uint8List bytes;
  final format = DateFormat("yyyy-MM-dd");

  @override
  initState() {
    _getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Espad",
          style: GoogleFonts.pacifico(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
                            onChanged: (value) {
                              name = value;
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
                          height: 80,
                          padding: EdgeInsets.fromLTRB(80, 15, 0, 0),
                          child: TextField(
                            onChanged: (value) {
                              mobile = value;
                            },
                            maxLength:11 ,
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
                          height: 80,
                          padding: EdgeInsets.fromLTRB(90, 15, 0, 0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              iDNo = value;
                            },
                            maxLength:10,
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
                    SizedBox(
                      width: 65,
                    ),
                    Flexible(
                        child: RaisedButton(
                      // padding: EdgeInsets.fromLTRB(90, 15, 0, 0),

                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(width: 1, color: Colors.black)),
                      onPressed: () {},
                      child: DateTimeField(
                          format: format,
                          onChanged: (value) {
                            birthDate = value.toString();
                          },
                          textAlign: TextAlign.center,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          }),
                    )), //f
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
                      width: 60,
                    ),
                    InkWell(
                      child: Container(
                          width: 100,
                          height: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(87, 239, 221, 1),
                              )),
                          child: Image.memory(
                            base64.decode(image),
                            fit: BoxFit.fill,
                            height: 180,
                            width: 130,
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
  void _getData() async {
    final pref = await SharedPreferences.getInstance();
    pref.reload();
    final getData = pref.getString('dataUsers');
    if (getData != null) {
      var decode = jsonDecode(getData);
      for (var i in decode) {
        String encodeData = jsonEncode(i);
        dataUsers.add(encodeData);
      }
    }
  }

//==============================================================================
  void _choose() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 180,
      maxWidth: 130,
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
        iDNo.isNotEmpty &&
        mobile.isNotEmpty) {
      _createUser();
    } else {
      _showSnackBarError(context);
    }
  }

//==============================================================================
  void _createUser() async {
    print("format");
    print(format);
    Map data = {
      "ID": getRandomString(10),
      "name": name,
      "family_name": familyName,
      "address": address,
      "birth_date": birthDate.substring(0, 10),
      "mobile": mobile,
      "id_no": iDNo,
      "image": image,
      "deleted": false,
    };
    String encodeData = jsonEncode(data);
    dataUsers.add(encodeData);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('dataUsers', dataUsers.toString());
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
  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
