import 'package:flutter/material.dart';
import 'package:mysample/Chat/PlaneApi.dart';

// TODO: взять ифнормацию из чата
class About extends StatefulWidget {
  AirRoad _airRoad = new AirRoad();
  About(AirRoad airRoad) {
    this._airRoad = airRoad;
  }
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  AirRoad _AirRoad = new AirRoad();
  _AboutState() {
    this._AirRoad = _AirRoad;
  }
  @override
  Widget build(BuildContext context) {
    return _buildCard(_AirRoad);
  }
}

Widget _buildCard(AirRoad _airRoad) => SizedBox(
      height: 370,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Ваш рейс: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              // subtitle: Text(_airRoad.numberOfFlight),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Окончание регистрации: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('13:30'),
              leading: Icon(
                Icons.timelapse_outlined,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Время вылета: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('15:55'),
              leading: Icon(
                Icons.timelapse_outlined,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Выход: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('A12'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Местоположение',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Вы находитесь около входа'),
              leading: Icon(
                Icons.explore,
                color: Colors.orange[700],
              ),
            ),
          ],
        ),
      ),
    );
