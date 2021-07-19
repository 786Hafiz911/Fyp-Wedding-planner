import 'package:flutter/material.dart';
import 'package:fyp_wed/landing_page.dart';

class card extends StatefulWidget {
  static final String path = "lib/src/pages/misc/musicplayer.dart";

  @override
  _PodcastPlayerState createState() => _PodcastPlayerState();
}

class _PodcastPlayerState extends State<card> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double topHeight = height * 0.4;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: topHeight,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/hotel/card.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardThreePage()));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Container(
                    height: height * 0.6,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0, 0.5, 1],
                        colors: [
                          Color(0xffff3a5a),
                          Color(0xffef2f5c),
                          Color(0xffba0c29)
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          ' Card Designer ',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                    onTap: () {},
                                    leading: Text(
                                      '${index + 1}.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    title: Text(
                                      ' Card Designer ${index + 1}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    subtitle: Text(
                                      ' Popular card designers',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
