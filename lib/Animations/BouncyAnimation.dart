import 'package:flutter/cupertino.dart';
import '../menudashboardpage.dart';

class Bouncy extends PageRouteBuilder{
  final Widget widget ; 
  Bouncy({this.widget}):super(
    transitionDuration: Duration(seconds:2),
    transitionsBuilder:(BuildContext context ,Animation<double> animation,Animation<double> secAnimation,Widget child){
      animation= CurvedAnimation(parent: animation, curve: Curves.bounceIn);
      return ScaleTransition(
        alignment: Alignment.center,
        scale: animation,
         child: child,
      );
    } ,
    pageBuilder: (BuildContext context ,Animation<double> animation,Animation<double> secAnimation){
      return widget;
    }                     
  );
}