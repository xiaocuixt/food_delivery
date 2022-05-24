import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/floationg_quick_access_bar.dart';
import 'package:food_delivery/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var _scrollPosition = 0;
    double _opacity = _scrollPosition < screenSize.height * 0.4
        ? _scrollPosition / screenSize.height * 0.4
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: TopBarContents(
            opacity: _opacity,
          )),
      body: Column(children: [
        Stack(
          children: [
            Container(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "images/background.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            FloatingQuickAccessBar(screenSize: screenSize),
          ],
        )
      ]),
    );
  }
}
