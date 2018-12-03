import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoListPage extends StatefulWidget {
  @override
  _CryptoListPageState createState() => new _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  List currencies = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.refresh();
  }

  RichText _getSubtitleText(String price, String percentChange1h) {
    TextSpan priceTextWidget = new TextSpan(
      text: "\ ¥$price\n",
      style: new TextStyle(color: Colors.black),
    );
    String percentChangeText = "1 hour: $percentChange1h%";
    TextSpan percentChangeTextWidget;

    if (double.parse(percentChange1h) < 0) {
      // Currency price increased. Color percent change text green
      percentChangeTextWidget = new TextSpan(
        text: percentChangeText,
        style: new TextStyle(color: Colors.green),
      );
    } else {
      // Currency price decreased. Color percent change text red
      percentChangeTextWidget = new TextSpan(
        text: percentChangeText,
        style: new TextStyle(color: Colors.red),
      );
    }

    return new RichText(
      text: new TextSpan(children: [priceTextWidget, percentChangeTextWidget]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        children: <Widget>[
          Text(
            'Cryptocurrencies',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
          Flexible(
            child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final Map currency = currencies[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      child: ListTile(
                        title: Text(currency['name']),
                        subtitle: _getSubtitleText(
                            currency['price_cny'], currency['percent_change_1h']),
                        isThreeLine: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> refresh() async {
    print('>>>refresh');
    String apiUrl =
        'https://api.coinmarketcap.com/v1/ticker/?limit=20&convert=CNY';
    http.Response response = await http.get(apiUrl);
    print('>>>get json results');
    List results=json.decode(response.body);
    setState(() {
      print('>>>>>${results[0]['price_cny']}');
      this.currencies=results;
    });
  }

  Future getMore() async {}
}
