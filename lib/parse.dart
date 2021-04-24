import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  String url =
      "https://5f383e6541c94900169bfd42.mockapi.io/api/v1/user_details";
  final response = await http.get(url);
  print(response.body);

  UserDetails userDetails = UserDetails.fromJson(jsonDecode(response.body));
  print(userDetails.name);
}

class UserDetails {
  String name = '';
  int rating = 0;
  int played = 0;
  int won = 0;
  int winningPercentage = 0;
  String image = '';

  // UserDetails(
  //     {this.name='',
  //     this.rating=0,
  //     this.played=0,
  //     this.won=0,
  //     this.winningPercentage=0,
  //     this.image=''});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    played = json['played'];
    won = json['won'];
    winningPercentage = json['winning_percentage'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['played'] = this.played;
    data['won'] = this.won;
    data['winning_percentage'] = this.winningPercentage;
    data['image'] = this.image;
    return data;
  }
}
