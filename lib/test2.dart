import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0 ; 
  bool isColapsed = true ; 
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds:300);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight= size.height;
    screenWidth = size.width;
    return AnimatedPositioned(
    
    duration: duration,
    top: isColapsed ? 0: 0.2*screenHeight,
    bottom :isColapsed ? 0: 0.2*screenWidth,
    left:isColapsed ? 0: 0.65*screenWidth,
    right:isColapsed ? 0: -0.35*screenWidth,
    child:Material(
      animationDuration: duration,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Scaffold(
        backgroundColor: Colors.grey,
        
        

        body:Form(
          key: _formKey,
          child:ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(child:Icon(Icons.menu,color:Colors.black), onTap: (){
                      setState(() {
                        isColapsed = !isColapsed;
                      });
                    },),
                    Text('Test2'),
                    Icon(Icons.settings,color:Colors.black),
                  ],
                ),
              ),
              Stepper(
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
                    return 'ID Est Vide';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Saisir Un ID',
                    hintText: 'Saisir Un ID',
                    icon: const Icon(Icons.person),
                ),
              ),
      ),

      Step(
        title: Text('Nom & Prenom'), 
        isActive: _currentStep>=0,
        content: new Container(
          child: Column(
            children:<Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Veuillez Saisir Un Nom';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Saisir Un Nom',
                    hintText: 'Saisir Un Nom',
                    icon: const Icon(Icons.person),
                ),
              ),

              TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Veuillez Saisir Un Prenom';
                  }
                  return null; 
                },
                decoration: new InputDecoration(
                    labelText: 'Saisir Un Prenom',
                    hintText: 'Saisir Un Prenom',
                    icon: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),

      Step(
        title: Text('Nom & Prenom'), 
        isActive: _currentStep>=0,
        content:Text('Nom & Prenom'), 
      ),

     
      


    ];
    return _steps ; 

  }
}