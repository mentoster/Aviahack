import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mysample/map/gmap.dart';

class MapController extends StatefulWidget {
  MapController({Key? key}) : super(key: key);

  @override
  _MapControllerState createState() => _MapControllerState();
}

/// This is the private State class that goes with MapController.
class _MapControllerState extends State<MapController> {
  int _selectedIndex = 0;
  // Chat chat = new Chat();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Твой аэропомощник'),
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
          child: IndexedStack(
        index: _selectedIndex,
        children: [
          Gmap(),
        ],
      )),
      floatingActionButton: SpeedDial(
        /// both default to 16
        marginEnd: 70,
        marginBottom: 20,
        // animatedIcon: AnimatedIcons.menu_close,
        // animatedIconTheme: IconThemeData(size: 22.0),
        /// This is ignored if animatedIcon is non null
        icon: Icons.add,
        activeIcon: Icons.remove,
        // iconTheme: IconThemeData(color: Colors.grey[50], size: 30),
        /// The label of the main button.
        // label: Text("Open Speed Dial"),
        /// The active label of the main button, Defaults to label if not specified.
        // activeLabel: Text("Close Speed Dial"),
        /// Transition Builder between label and activeLabel, defaults to FadeTransition.
        // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
        /// The below button size defaults to 56 itself, its the FAB size + It also affects relative padding and other elements
        buttonSize: 80.0,
        visible: true,

        /// If true user is forced to close dial manually
        /// by tapping main button and overlay is not rendered.
        closeManually: false,

        /// If true overlay will render no matter what.
        renderOverlay: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        // orientation: SpeedDialOrientation.Up,
        // childMarginBottom: 2,
        // childMarginTop: 2,
        children: [
          SpeedDialChild(
            child: Icon(Icons.map),
            backgroundColor: Colors.white,
            label: 'Карта',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _selectedIndex = 0;
              _onItemTapped(_selectedIndex);
            },
            onLongPress: () => print('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_one),
            backgroundColor: Colors.white,
            label: 'Первый',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _selectedIndex = 1;
              _onItemTapped(_selectedIndex);
            },
            onLongPress: () => print('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_two),
            backgroundColor: Colors.white,
            label: 'Второй',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _selectedIndex = 2;
              _onItemTapped(_selectedIndex);
            },
            onLongPress: () => print('SECOND CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_3),
            backgroundColor: Colors.white,
            label: 'Третий',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _selectedIndex = 3;
              _onItemTapped(_selectedIndex);
            },
            onLongPress: () => print('THIRD CHILD LONG PRESS'),
          ),
        ],
      ),
    );
  }
}
