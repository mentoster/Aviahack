import 'package:flutter/material.dart';
import 'package:mysample/Chat/StartMessage.dart';
import 'package:mysample/about.dart';
import 'package:mysample/map/gmap.dart';
import 'package:mysample/map/map.dart';
import 'Chat/Chat.dart';

void main() => runApp(MyApp());

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
  AskNumberOffFlight _askNumberOffFlight = new AskNumberOffFlight();
  _MyStatefulWidgetState() {
    _askNumberOffFlight.numberOfFlight = "1";
  }
  int _selectedIndex = 0;
  // Chat chat = new Chat();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[];

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
          Chat(),
          About(_askNumberOffFlight),
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
