import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/bottom_bar.dart';
import 'package:food_delivery/widgets/carousel.dart';
import 'package:food_delivery/widgets/feature_heading.dart';
import 'package:food_delivery/widgets/featured_tile.dart';
import 'package:food_delivery/widgets/floationg_quick_access_bar.dart';
import 'package:food_delivery/widgets/main_heading.dart';
import 'package:food_delivery/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    var screenSize = MediaQuery.of(context).size;
    double _scrollPosition = 0;
    double _opacity = _scrollPosition < screenSize.height * 0.4
        ? _scrollPosition / (screenSize.height * 0.4)
        : 1;

    _scrollListener() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    }

    @override
    void initState() {
      _scrollController.addListener(_scrollListener);
      super.initState();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: TopBarContents(
            opacity: _opacity,
          )),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(children: [
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
              Column(
                children: [
                  FloatingQuickAccessBar(screenSize: screenSize),
                  FeatureHeading(screenSize: screenSize),
                  FeaturedTile(screenSize: screenSize),
                  MainHeading(screenSize: screenSize),
                  MainCarousel(),
                  SizedBox(
                    height: screenSize.height / 10,
                  ),
                  BottomBar(),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
