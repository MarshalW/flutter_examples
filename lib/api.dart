import 'dart:convert';

import 'package:http/http.dart' as http;

const int step = 20;

Future<List> refreshData() async {
  String apiUrl =
      'https://api.coinmarketcap.com/v1/ticker/?limit=$step&convert=CNY';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

Future<List> getMoreData(int start) async {
  print('>>>start $start');
  String apiUrl =
      'https://api.coinmarketcap.com/v1/ticker/?start=$start&limit=$step&convert=CNY';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
