import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysample/Static.dart';

class AirRoad {
  String title = '';
  String departure = '';
  String number = '';
  String terminal = '';
  String vehicle = '';
}

Future<AirRoad> PlaneApi(String countryTo, int tryNumber) {
  AirRoad airRoad = new AirRoad();
  String token = ApiKeys.FlyToken;
  String date = '2021-04-24';
  print("i work");
  Map map;
  String url = 'https://api.rasp.yandex.net/v3.0/schedule/?apikey=' +
      token +
      ' &station=s9600213&date=' +
      date +
      '&transport_types=plane&direction=none&limit=100';

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
        airRoad.number = buffMap["thread"]["number"];
        airRoad.vehicle = buffMap["thread"]["vehicle"];
        airRoad.title = buffMap["thread"]["title"];
        airRoad.terminal = buffMap["terminal"];
        airRoad.departure = buffMap["departue"];
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
