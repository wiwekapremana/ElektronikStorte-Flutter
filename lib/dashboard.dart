import 'package:flutter/material.dart';
import 'package:google_signin_example/ui/home.dart';
import './setting.dart';
import "./drawer.dart" as drawer;

class Dashboard extends StatefulWidget {
  Duration get loginTime => Duration(milliseconds: 2250);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text("Dashboard"), actions: [new Icon(Icons.search)]),
        backgroundColor: Colors.teal,
        drawer: drawer.Menudrawer(),
        body: Container(
          color: Colors.blue[100],
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Image.network(
                      "https://c8.alamy.com/comp/2CD7H7D/cute-friendly-robot-electronic-bot-friend-on-blue-background-cartoon-tech-assistant-android-white-robot-cute-vector-illustration-robotics-2CD7H7D.jpg"),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 90,
                          height: 90,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.format_list_bulleted),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DataScreen()));
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("List Produk"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 90,
                          height: 90,
                          //color: Colors.red,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    IconButton(
                                      icon: new Icon(Icons.settings),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (context) {
                                            return Setting();
                                          }),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Pengaturan"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
