import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:espad/pages/spalsh/spalsh.dart';
import 'package:espad/pages/users/addUsers.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:espad/pages/users/editUsers.dart';
import 'checkUsers.dart';
import 'package:espad/images/images.dart';

//==============================================================================

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController editingController = TextEditingController();
  bool isChecked = false;
  List duplicateItems = [];
  List items = [];
  List deleted = [];
  List updateItems = [];
  String itemsUser = '';
  bool showBtn = false;
  String logo = Images().logo;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  child: Image.memory(
                    base64.decode(logo),
                    height: 25,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "Espad",
                    style: GoogleFonts.pacifico(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    this._refreshApp();
                  },
                ),
              ],
            ),
          )),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: usersSearch,
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Name, Family Name, ID NO",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            if (showBtn)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 25,
                      color: Colors.black,
                      icon: Icon(TablerIcons.trash),
                      onPressed: _usersDelete),
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Checkbox(
                      value: isChecked,
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked == true) {
                            for (var i in items) {
                              i['deleted'] = true;
                              deleted.add(i);
                            }
                          } else {
                            for (var i in items) {
                              i['deleted'] = false;
                              deleted.add(i);
                            }
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(227, 227, 227, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      height: 220,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.memory(
                                    base64.decode("${items[index]['image']}"),
                                    fit: BoxFit.fill,
                                    height: 150,
                                    width: 120,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    child: Text(
                                        "Name : ${items[index]['name']}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold) // has impact
                                        ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    child: Text(
                                        "Family Name : ${items[index]['family_name']}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold) // has impact
                                        ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    child: Text(
                                        "Birth date : ${items[index]['birth_date']}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold) // has impact
                                        ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: 200,
                                    child: Text(
                                        "ID No : ${items[index]['id_no']}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold) // has impact
                                        ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                iconSize: 22,
                                color: Colors.black,
                                icon: Icon(TablerIcons.pencil),
                                onPressed: () {
                                  setState(() {
                                    itemsUser = items[index]["ID"];
                                  });
                                  _sendItemsToEditPage(context);
                                },
                              ),
                              Container(
                                child: Checkbox(
                                  value: items[index]['deleted'],
                                  activeColor: Colors.blue,
                                  checkColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      items[index]['deleted'] = value;
                                      deleted.add(items[index]);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 20, 15),
                                    width: 110,
                                    child: RaisedButton(
                                      color: Color.fromRGBO(87, 239, 221, 1),
                                      splashColor: Colors.black,
                                      child: Text(
                                        'check',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          itemsUser = items[index]["ID"];
                                        });
                                        _sendItemsToCheckPage(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.black,
        backgroundColor: Color.fromRGBO(87, 239, 221, 1),
        onPressed: _addUsers,
        child: Icon(Icons.add),
      ),
    );
  }

//==============================================================================
  void _addUsers() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddUsers();
    }));
  }

//==============================================================================
  void _refreshApp() async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Splash();
    }));
  }

//==============================================================================
  void usersSearch(String value) {
    List results = [];
    if (value.isEmpty) {
      results = duplicateItems;
    } else {
      results = items
          .where((user) =>
              user["name"].toLowerCase().contains(value.toLowerCase()) ||
              user["family_name"].toLowerCase().contains(value.toLowerCase()) ||
              user["id_no"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      items = results;
    });
  }

//==============================================================================
  void _usersDelete() async {
    for (var i in deleted) {
      if (i['deleted'] == true) {
        items.remove(i);
        duplicateItems.remove(i);

        setState(() {
          items = duplicateItems;
        });
        String encodeData = jsonEncode(items);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('dataUsers', encodeData.toString());
        this.usersSearch('');
        editingController.clear();

        if (items.isEmpty) {
          showBtn = false;
        }
      }
    }
  }

//==============================================================================
  void _getData() async {
    final pref = await SharedPreferences.getInstance();
    final getData = pref.getString('dataUsers');
    if (getData != null) {
      showBtn = true;
      var decode = jsonDecode(getData);
      setState(() {
        items = decode;
        duplicateItems = decode;
      });
    }
  }

//==============================================================================
  void _sendItemsToCheckPage(BuildContext context) {
    String textToSend = itemsUser;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckUsers(
            itemsUsers: textToSend,
          ),
        ));
  }

//==============================================================================
  void _sendItemsToEditPage(BuildContext context) {
    String textToSend = itemsUser;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditUsers(
            itemsUsers: textToSend,
          ),
        ));
  }
}
