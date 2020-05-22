
import 'package:flutter/material.dart';
import 'package:pfe_project/addpatient.dart';
import 'package:pfe_project/calendar.dart';
import 'package:pfe_project/test2.dart';
import 'package:hexcolor/hexcolor.dart';

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> {
  Items item1 = new Items(
      title: "Add Patient ",
      subtitle: "addpatient",
      img: "images/addpatient.png");

  Items item2 = new Items(
    title: "Calendar",
    subtitle: "calendar",
    img: "images/agenda.png",
  );
  Items item3 = new Items(
    title: "Appointment",
    subtitle: 'appointment',
    img: "images/appointment.png",
  );

  bool page = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children:<Widget>[
          
          clippath(context),
          _getNavBar(context),
          menu(context),
          
          Addpatient(),
          
        ],
      ),
      
    );
  }

  Widget menu(context){
    List<Items> myList = [item1, item2, item3];
    return Container(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 15, top: 250, right: 160),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data){
          return Container(
            decoration: BoxDecoration(
                  color: Hexcolor("#1c9780"),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(child: Text(data.title,
                    style: TextStyle(
                      color:Colors.white,
                    ),
                  ),
                  onTap: (){
                    if(data.subtitle=='addpatient'){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        Scaffold(
                          body:Stack(children:<Widget>[
                            clippath(context),
                            _getNavBar(context),
                            menu(context),
                            Addpatient()]),
                        ),
                      ),
                    );
                    }else if(data.subtitle=='calendar'){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        Scaffold(
                          body:Stack(children:<Widget>[
                            clippath(context),
                            _getNavBar(context),
                            menu(context),
                            Calendar()]),
                        ),
                      ),
                    );
                    }
                  },),
                ],
              ),
          );
        }).toList()
      ),
    );
  }
  Widget clippath(context){
    return Scaffold(
      body: Column(
        children:<Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height:150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Hexcolor("#50d5b7"),
                      Hexcolor("#067d68"),
                ])),
            ),
          ),
        ],
      ),
    );
  }
}
class Items {
  String title;
  String subtitle;
  String img;
  Items({this.title, this.subtitle, this.img});
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
_getNavBar(context) {
  return Stack(
    children: <Widget>[
      Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: NavBarClipper(),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Hexcolor("#067d68"),
                      Hexcolor("#50d5b7"),
                ])),
          ),
        ),
      ),
      Positioned(
        bottom: 45,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildNavItem(Icons.bubble_chart),
            SizedBox(width: 1),
            _buildNavItem(Icons.landscape),
            SizedBox(width: 100),
            
          ],
        ),
      ),
      Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Focus',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              width: 1,
            ),
            Text('Relax',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            SizedBox(width: 100),
            
          ],
        ),
      )
    ],
  );
}

_buildNavItem(IconData icon) {
  return CircleAvatar(
    radius: 30,
    backgroundColor:Hexcolor("#50d5b7"),
    child: CircleAvatar(
      radius: 25,
      backgroundColor:
          Colors.white,
      child: Icon(
        icon,
        color:Hexcolor("#067d68"),
      ),
    ),
  );

}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
  
  
  
  
  


