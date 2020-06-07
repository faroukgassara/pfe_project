import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data ; 
  List usersData;

  
    
  getUsers() async{
    var response = await http.get('http://10.0.3.2:5000');
    
    data = json.decode(response.body);
    debugPrint('response.body');
    setState(() {
      usersData = data["users"];
    });
      
    
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:5000';
    else // for iOS simulator
      return 'http://localhost:5000';
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter listview with json'),
      ),
      body: ListView.builder(
        itemCount:usersData == null ? 0 :  usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${usersData[index]["nom"]}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "QSDQSD",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                ],
              ),
            ),
          );
        },
        
      )
    );
  }
}


