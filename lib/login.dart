import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe_project/Animations/BouncyAnimation.dart';
import 'package:pfe_project/Animations/FadeAnimation.dart';
import 'package:pfe_project/addpatient.dart';
import 'package:pfe_project/menudashboardpage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible ;
  @override
    void initState() {
      passwordVisible = true;
    }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
          FadeAnimation(1,
            Container(
              child: Column(
                children:<Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height:300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Hexcolor("#50d5b7"),
                            Hexcolor("#067d68"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      
        
        Positioned(
          left: 30,
          top:50,
          width: 80,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('images/medequi1.png'),
              ),
            ),
          ),
        ),
        

        Positioned(
          left: 270,
          top:170,
          width: 100,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('images/medequi3.png'),
              ),
            ),
          ),
        ),

        
        Positioned(
          left: 180,
          top:60,
          child: Container(
            child: Text(
              "LOGIN",
               style:TextStyle(
                color:Colors.white,
                fontSize:70,
                fontWeight:FontWeight.bold,
                fontFamily: 'Anton',
              ),
            ),
          ),
        ),
        

        
          Padding(
	        padding: EdgeInsets.fromLTRB(30, 400, 30, 10),
	          child: Column(
	            children: <Widget>[
	              FadeAnimation(2,
	                Container(
	                  padding: EdgeInsets.all(5),
	                  decoration: BoxDecoration(
	                    color: Colors.grey[300],
	                    borderRadius: BorderRadius.circular(10),
	                    boxShadow: [
	                      BoxShadow(
	                        color: Hexcolor("#067d68"),
	                        blurRadius: 20.0,
	                        offset: Offset(0, 10)
	                      ),
                      ]
	                  ),
	                  child: Column(
	                    children: <Widget>[
	                      Container(
	                        padding: EdgeInsets.all(8.0),
	                        child: TextField(
	                          decoration: InputDecoration(
	                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color:Hexcolor("#067d68"), width: 1.0),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "id",
                              labelText: "id",
	                            hintStyle: TextStyle(color: Colors.grey)
	                          ),
	                        ),
	                      ),
	                      Container(
	                        padding: EdgeInsets.all(8.0),
	                        child: TextField(
                            obscureText: passwordVisible,
	                          decoration: InputDecoration(
	                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color:Hexcolor("#067d68"), width: 1.0),
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                              ),
	                            hintText: "Password",
                              labelText: "Password",
	                            hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                  color: Colors.grey,
                                ), 
                                onPressed:(){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                });
                                } ,
                              ),
                              
	                          ),
	                        ),
	                      ),
	                    ],
	                  ),
	                ),
	              ),
                  SizedBox(height: 30,),
                  FadeAnimation(3,
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          Bouncy(
                            widget: MenuDashboardPage()
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
	                          colors: [
                              Hexcolor("#50d5b7"),
                              Hexcolor("#067d68"),
	                          ],
	                        ),
                        ),
                        child: Center(
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/4, size.height
    - 80, size.width/2, size.height-40);
    path.quadraticBezierTo(3/4*size.width, size.height,
    size.width, size.height-30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}




