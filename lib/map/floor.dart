import 'package:flutter/material.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class Floor extends StatelessWidget {
  String imagePath = '';
  Floor(String path) {
    imagePath = path;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinchZoomImage(
        image: Image.asset(imagePath),
        zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
        hideStatusBarWhileZooming: true,
        onZoomStart: () {
          print('Zoom started');
        },
        onZoomEnd: () {
          print('Zoom finished');
        },
      ),
    );
  }
}
