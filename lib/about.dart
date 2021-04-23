import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }
}

Widget _buildCard() => SizedBox(
      height: 500,
      child: Card(
        child: Column(
          children: [
            // ListTile(
            //   title: Text('1625 Main Street',
            //       style: TextStyle(fontWeight: FontWeight.w500)),
            //   subtitle: Text('My City, CA 99984'),
            //   leading: Icon(
            //     Icons.restaurant_menu,
            //     color: Colors.blue[500],
            //   ),
            // ),
            // Divider(),
            // ListTile(
            //   title: Text('(408) 555-1212',
            //       style: TextStyle(fontWeight: FontWeight.w500)),
            //   leading: Icon(
            //     Icons.contact_phone,
            //     color: Colors.blue[500],
            //   ),
            // ),
            // ListTile(
            //   title: Text('costa@example.com'),
            //   leading: Icon(
            //     Icons.contact_mail,
            //     color: Colors.blue[500],
            //   ),
            // ),

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
                Icons.gps_fixed,
                color: Colors.blue[500],
              ),
            ),

            ListTile(
              title: Text('Время вылета: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('13:55'),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.blue[500],
              ),
            ),

            ListTile(
              title: Text('Выход: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('A12'),
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.blue[500],
              ),
            ),
            // ListTile(
            //   title: Text('1625 Main Street',
            //       style: TextStyle(fontWeight: FontWeight.w500)),
            //   subtitle: Text('My City, CA 99984'),
            //   leading: Icon(
            //     Icons.restaurant_menu,
            //     color: Colors.blue[500],
            //   ),
            // ),
          ],
        ),
      ),
    );
