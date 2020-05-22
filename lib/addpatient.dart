import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';

class Addpatient extends StatefulWidget {
  @override
  _AddpatientState createState() => _AddpatientState();
}

class _AddpatientState extends State<Addpatient> {

  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0 ; 
  bool isColapsed = true ; 
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds:300);
  DateTime _dateTime;
  var myFormat = DateFormat('d-MM-yyyy');
  String selected;

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
        body:Form(
          key: _formKey,
          child:ListView(
            children: <Widget>[
              
              Container(    
                child: Stepper(
                  steps: _mySteps(),
                  currentStep: this._currentStep,
                  onStepTapped: (step){
                    setState(() {
                      this._currentStep = step;
                    });
                  },
                  onStepContinue: (){
                      setState(() {
                      if(this._currentStep<this._mySteps().length-1 && _formKey.currentState.validate()){
                        this._currentStep = this._currentStep+1;
                      }
                    });
                  },
                  onStepCancel: (){
                    setState(() {
                      if(this._currentStep>0){
                        this._currentStep = this._currentStep-1;
                      }else{
                        this._currentStep = 0 ;
                      }
                    });
                  },
                ),
              ),
            ],
          ), 
        ),
      ),
    ),);
  }
    
  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
      title: Text('ID'), 
      isActive: _currentStep>=0,
      content:TextFormField(
                validator: (value) {
                  if ( !isNumeric(value) || value.length<1) {
                    return 'ID Is Empty';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Enter An ID',
                    hintText: 'Enter An ID',
                    icon: const Icon(Icons.person),
                ),
              ),
      ),

      Step(
        title: Text('Last Name & First Name'), 
        isActive: _currentStep>=0,
        content: new Container(
          child: Column(
            children:<Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Please Enter Last Name';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Enter Last Name',
                    hintText: 'Enter Last Name',
                    icon: const Icon(Icons.person),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Please Enter First Name';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Enter First Name',
                    hintText: 'Enter First Name',
                    icon: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),

      Step(
        title: Text('Date of Birth'), 
        isActive: _currentStep>=0,
        content:Column(
            children: <Widget>[
              Text(
                _dateTime == null ? 'Nothing Has Been Picked Yet':myFormat.format(_dateTime).toString(),
                style: TextStyle(fontSize:20),
              ),
              SizedBox(height:10),
              RaisedButton(
                onPressed: (){
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(1950), 
                    lastDate: DateTime(2021),
                  ).then((date){
                    setState(() {
                      _dateTime=date;
                    });
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Age",
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

      Step(
        isActive: _currentStep>=0,
        title: Text('Maternal Status'), 
        content: DropdownButtonFormField<String>(
          value: selected ?? "Married",
          icon: Icon(Icons.arrow_downward),
          iconSize: 20,
          style: TextStyle(
            color: Colors.black
          ),
            items: ["Married", "Single"]
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() => selected = value);
            },
          ),
      ),
    ];
    return _steps ; 
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