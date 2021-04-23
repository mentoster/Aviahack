import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
        child: Image.asset(
      'assets/images/b_1.png',
      height: size.height,
    ));
  }
}
