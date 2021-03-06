import 'package:flutter/material.dart';
import 'package:mysample/Chat/PlaneApi.dart';
import 'package:mysample/about.dart';
import 'package:mysample/map/mapControroller.dart';
import 'Chat/Chat.dart';
import 'package:shared_value/shared_value.dart';

// This global SharedValue can be shared across the entire app
final SharedValue<AirRoad> dataShare = SharedValue(
  value: AirRoad(), // initial value (optional)
);
void main() => runApp(
      SharedValue.wrapApp(
        MyApp(),
      ),
    );

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Твой аэропомощник';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
          MapController(),
          Chat(),
          About(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'info',
            // label:
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
