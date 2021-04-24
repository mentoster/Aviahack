import 'package:flutter/material.dart';
import 'package:mysample/Chat/StartMessage.dart';

// TODO: взять ифнормацию из чата
class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  // AskNumberOffFlight
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }
}

Widget _buildCard() => SizedBox(
      height: 370,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Ваш рейс: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('КУКУРУЗНИК К-1'),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Окончание регистрации: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('13:30'),
              leading: Icon(
                Icons.timelapse_outlined,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Время вылета: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('13:55'),
              leading: Icon(
                Icons.timelapse_outlined,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Выход: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('A12'),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Местоположение',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Вы находитесь около входа'),
              leading: Icon(
                Icons.explore,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
