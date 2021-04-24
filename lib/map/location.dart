/*import 'package:flutter_google_places/flutter_google_places.dart' as google_place;
import 'package:google_maps_webservice/places.dart' as map_service;*/
import 'package:location/location.dart';

/*Future _getLocation() async {
        Location location = new Location();
        LocationData _currentPosition = await location.getLocation();
        SharedPrefrence().setLatitude(_currentPosition.latitude.toString());
        SharedPrefrence().setLongitude(_currentPosition.longitude.toString());
       
        Future loginstatus = SharedPrefrence().getLogedIn();
      
          loginstatus.then((data) {
            if (data == true) {
              Navigator.pop(context, true);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  ModalRoute.withName("/login"));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
          });
        
      }
      */