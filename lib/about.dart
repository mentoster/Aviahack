import 'package:flutter/material.dart';
import 'package:mysample/Chat/StartMessage.dart';

// TODO: взять ифнормацию из чата
class About extends StatefulWidget {
  AskNumberOffFlight _askNumberOffFlight = new AskNumberOffFlight();
  About(AskNumberOffFlight askNumberOffFlight) {
    this._askNumberOffFlight = askNumberOffFlight;
  }
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  AskNumberOffFlight _askNumberOffFlight = new AskNumberOffFlight();
  _AboutState() {
    this._askNumberOffFlight = _askNumberOffFlight;
  }
  @override
  Widget build(BuildContext context) {
    return _buildCard(_askNumberOffFlight);
  }
}

Widget _buildCard(AskNumberOffFlight _askNumberOffFlight) => SizedBox(
      height: 370,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Ваш рейс: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(_askNumberOffFlight.numberOfFlight),
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
