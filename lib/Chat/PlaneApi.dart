import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mysample/Static.dart';

class AirRoad {
  String title = '';
  String departure = '';
  String number = '';
  String terminal = '';
  String vehicle = '';
  String where = 'Вы около входа';
}

Future<AirRoad> PlaneApi(String countryTo, int tryNumber) {
  AirRoad airRoad = new AirRoad();
  String token = ApiKeys.FlyToken;
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String date = formatter.format(now);
  Map map;
  String url = 'https://api.rasp.yandex.net/v3.0/schedule/?apikey=' +
      token +
      ' &station=s9600213&date=' +
      date +
      '&transport_types=plane&direction=none&limit=1000';

  Future<String> GetJson() async {
    final response = await http.get(url);
    return response.body;
  }

  Future<AirRoad> ParseJson() async {
    var body = await GetJson();
    final Map parsed = json.decode(body);
    for (var i = 0; i < 50; i++) {
      if (parsed["schedule"][i]["thread"]["short_title"]
          .toLowerCase()
          .contains(countryTo.toLowerCase())) {
        var buffMap = parsed["schedule"][i];
        airRoad.number = buffMap["thread"]["number"].toString();
        airRoad.vehicle = buffMap["thread"]["vehicle"].toString();
        airRoad.title = buffMap["thread"]["title"].toString();
        airRoad.terminal = buffMap["terminal"].toString();
        airRoad.departure = buffMap["departure"].toString();
        print(airRoad.departure);
        if (tryNumber == 0) {
          break;
        } else {
          --tryNumber;
        }
      }
    }
    return airRoad;
  }

  return ParseJson();
}
