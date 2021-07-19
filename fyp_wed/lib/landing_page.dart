import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fyp_wed/barberlist.dart';
import 'package:fyp_wed/bookingmenu.dart';
import 'package:fyp_wed/bridal.dart';
import 'package:fyp_wed/cake.dart';
import 'package:fyp_wed/florist.dart';
import 'package:fyp_wed/main.dart';
import 'package:fyp_wed/photo.dart';
import 'package:fyp_wed/wedcard.dart';

final TextStyle whiteText = TextStyle(color: Colors.white);

class DashboardThreePage extends StatelessWidget {
  final String avatar = "assets/img/png";
  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.wheelchair_pickup_rounded,
                          title: "Groom Wears Tailors",
                          data: "Find best tailors",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => barberList()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.airline_seat_legroom_reduced,
                          title: "Bridal Dressing",
                          data: "Clothing and Hair Dressing",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bridalList()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.card_membership,
                          title: "Wedding Cards",
                          data: "Invitation Card",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => wedcard()));
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.cake,
                          title: "Food",
                          data: "Byriani, Shahi Daal etc.",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => cake()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.flare,
                          title: "Florist",
                          data: "Decorate your destination",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => florist()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.camera,
                          title: "Photography",
                          data: "Photography & Video Shooting",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => photo()));
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.power_settings_new_rounded,
                          title: "Sign Out",
                          data: " ",
                        ),
                      ],
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.favorite,
                          title: "Hotel Booking",
                          data: "Find your dream destination",
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelBookingPage()));
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildTile(
                          icon: Icons.close,
                          title: "Exit",
                          data: " ",
                        ),
                      ],
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTile({IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xbfff214c),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black,
            size: 30,
          ),
          Text(
            title,
            style:
                whiteText.copyWith(fontWeight: FontWeight.w100, fontSize: 16.0),
          ),
          Text(
            data,
            style: whiteText.copyWith(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                color: Color(0xff6d6f73)),
          ),
        ],
      ),
    );
  }
}

Stack _buildHeader() {
  return Stack(
    children: <Widget>[
      ClipPath(
        clipper: WaveClipper2(),
        child: Container(
          child: Column(),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
        ),
      ),
      ClipPath(
        clipper: WaveClipper3(),
        child: Container(
          child: Column(),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
        ),
      ),
      ClipPath(
        clipper: WaveClipper1(),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.addchart_sharp,
                color: Colors.white,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Plan your Wedding",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ],
          ),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
        ),
      ),
    ],
  );
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
