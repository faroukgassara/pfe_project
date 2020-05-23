import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0 ; 
  bool isColapsed = true ; 
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds:300);
  DateTime _dateTime = DateTime.now();
  var myFormat = DateFormat('d-MM-yyyy');
  String selected;

  Future<Null> _selectDate(BuildContext context) async{
    DateTime _datePicker = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(1950), 
      lastDate: DateTime(2021),
      builder: (BuildContext context ,Widget child){
        return Theme(
          data: ThemeData(
            primarySwatch:Colors.blue,
          ),
          child: child,
        );
      },
    );
    if(_datePicker != Null && _datePicker != _dateTime){
      setState(() {
        _dateTime = _datePicker;
        print(_dateTime.toString());
      });
    }
                    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight= size.height;
    screenWidth = size.width;
    return AnimatedPositioned(
      duration: duration,
      top: isColapsed ? 0: 0.2*screenHeight,
      bottom :isColapsed ? 0: 0.08*screenWidth,
      left:isColapsed ? 0: 0.65*screenWidth,
      right:isColapsed ? 0: -0.35*screenWidth,
      child:Material(
        animationDuration: duration,
        child: Scaffold(
          appBar: _getAppBar(),
          backgroundColor: Colors.white, 
          body:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  readOnly: true,
                onTap: (){
                  setState(() {
                    _selectDate(context);
                  });
                },
	              decoration: InputDecoration(
	                 enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:Hexcolor("#067d68"), width: 1.0),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                    ),
                    labelText: "Date",
                    hintText: _dateTime == null ? 'Nothing Has Been Picked Yet':myFormat.format(_dateTime).toString(),
	                  hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.grey),
	              ),
	            ),
              ),
              SizedBox(height:10),
              RaisedButton(
                onPressed: (){
                  setState(() {
                    _selectDate(context);
                  });
                  
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Hexcolor("#50d5b7"),
                      Hexcolor("#067d68"),
                  ]
                  ),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Search By Date",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  
                  ),
                ),
                ),
              ),
            ],
        ), 
        
        ),
      ),
    );
  }
    
  

_getAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      padding: const EdgeInsets.only(top:25),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [ 
            Hexcolor("#067d68"),
            Hexcolor("#50d5b7"),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(child:Icon(Icons.menu,color:Hexcolor("#50d5b7")), onTap: (){
                        setState(() {
                          isColapsed = !isColapsed;
                        });
                      },),
                      Column(
                        children: <Widget>[
                          Text(
                            'Add Patient',
                            style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,

                            ) ,
                          ),
                        ],
                      ),
                      Icon(Icons.settings,color:Hexcolor("#067d68")),
                    ],
                  ),
      ),
    ),
  );
}

    
}