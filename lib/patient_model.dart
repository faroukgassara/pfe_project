
import 'package:flutter/material.dart';

class Patient with ChangeNotifier   {
  int idpatient;
  String nom;
  String prenom;
  String sex;
  int statusmatriomo_id;

  Patient({this.idpatient,this.nom, this.prenom,this.sex,this.statusmatriomo_id});

  factory Patient.formJson(Map <String, dynamic> json){
    return new Patient(
       idpatient: json['idpatient'],
       nom: json['nom'],
       prenom: json['prenom'],
       sex: json['sex'],
       statusmatriomo_id: json['statusmatriomo_id'],
    );
  }
    Widget  _buildnom() {
      return TextFormField(
        initialValue: '',
        decoration: InputDecoration(
            labelText: 'nom',
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(18.0),
                borderSide: new BorderSide())),
        maxLength: 20,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
          onSaved: (String value) {
           nom = value;
          }
       
      );
  }
}



