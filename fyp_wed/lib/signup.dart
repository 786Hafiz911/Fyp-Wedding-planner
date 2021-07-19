import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_wed/main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

enum FormType { login, register }

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  String _email;
  String _password;
  FormType _formType = FormType.register;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          User user = (await _auth.signInWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
          print('Signed In: ${user.uid}');
        } else {
          User user = (await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
          print('Registered User: ${user.uid}');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            _buildHeader(),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + buildSubmitButtons(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.email_sharp,
            color: Color(0xffff3a5a),
            size: defaultIconSize,
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xff000000),
              fontFamily: defaultFontFamily,
              fontSize: defaultFontSize),
          hintText: "Email",
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.vpn_key_sharp,
            color: Color(0xffff3a5a),
            size: defaultIconSize,
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xff000000),
              fontFamily: defaultFontFamily,
              fontSize: defaultFontSize),
          hintText: "Password",
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        Container(
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(17.0),
            onPressed: () {
              validateAndSubmit();
            },
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins-Medium.ttf',
              ),
              textAlign: TextAlign.center,
            ),
            color: Color(0xfffe494d),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
                side: BorderSide(color: Color(0xfffe494d))),
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
        ),
      ];
    } else {
      return [
        Container(
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(17.0),
            onPressed: () {
              validateAndSubmit();
            },
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins-Medium.ttf',
              ),
              textAlign: TextAlign.center,
            ),
            color: Color(0xfffe494d),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
                side: BorderSide(color: Color(0xfffe494d))),
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'or',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        FlatButton(
          child: Text(
            'LOGIN',
            style: TextStyle(fontSize: 20.0, color: Color(0xfffe494d)),
          ),
          onPressed: moveToLogin,
        )
      ];
    }
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
          height: 250,
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
          height: 250,
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
          height: 250,
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
