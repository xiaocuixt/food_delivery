import 'package:flutter/material.dart';

class FeatureHeading extends StatefulWidget {
  const FeatureHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;

  @override
  _FeatureHeadingState createState() => _FeatureHeadingState();
}

class _FeatureHeadingState extends State<FeatureHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.06,
        left: widget.screenSize.height / 15,
        right: widget.screenSize.height / 15,
      ),
      child: Row(children: [
        Text(
          "Featured",
          style: TextStyle(
            fontSize: 36,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Color(0xFF077bd7),
          ),
        ),
        Expanded(
          child: Text(
            "Clue of the wooden cottage",
            textAlign: TextAlign.end,
          ),
        )
      ]),
    );
  }
}
