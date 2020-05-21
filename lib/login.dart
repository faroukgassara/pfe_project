import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe_project/Animations/FadeAnimation.dart';
import 'package:pfe_project/addpatient.dart';
import 'package:pfe_project/menudashboardpage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
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
          left: 150,
          top:100,
          child: Container(
            child: Text(
              "Login",
               style:TextStyle(
                color:Colors.white,
                fontSize:40,
                fontWeight:FontWeight.bold,
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
	                        decoration: BoxDecoration(
	                          border: Border(bottom: BorderSide(color: Colors.grey[100]))
	                        ),
	                        child: TextField(
	                          decoration: InputDecoration(
	                            border: InputBorder.none,
	                            hintText: "id",
	                            hintStyle: TextStyle(color: Colors.grey)
	                          ),
	                        ),
	                      ),
	                      Container(
	                        padding: EdgeInsets.all(8.0),
	                        child: TextField(
	                          decoration: InputDecoration(
	                            border: InputBorder.none,
	                            hintText: "Password",
	                            hintStyle: TextStyle(color: Colors.grey)
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
                          MaterialPageRoute(builder: (context) => MenuDashboardPage()),
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




