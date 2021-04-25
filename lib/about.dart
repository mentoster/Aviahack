import 'package:flutter/material.dart';
import 'package:mysample/Chat/PlaneApi.dart';
import 'package:mysample/main.dart';
import 'package:shared_value/shared_value.dart';
import 'package:share/share.dart';

// TODO: взять ифнормацию из чата
class About extends StatefulWidget {
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(dataShare.$);
  }
}

Widget _buildCard(AirRoad airRoad) => SizedBox(
      height: 500,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Ваш рейс: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(airRoad.number + ", " + airRoad.title),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Отправление',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(airRoad.departure),
              leading: Icon(
                Icons.timelapse_outlined,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Терминал: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(airRoad.terminal),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.orange[700],
              ),
            ),
            ListTile(
              title: Text('Самолет',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(airRoad.vehicle),
              leading: Icon(
                Icons.airplanemode_active,
                color: Colors.orange[700],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.orange[700],
                ),
                onPressed: () => shareInfo()),
          ],
        ),
      ),
    );
void shareInfo() {
  print("share");
  // Share.shareFiles(['assets/images/aeroPort.jpeg'],
  //     text:
  //         'Я отлично провёл время в аэропорту Шереметьево в компании Айриса =)');
  Share.share(
      'Я отлично провёл время в аэропорту Шереметьево в компании Айриса =)');
}
