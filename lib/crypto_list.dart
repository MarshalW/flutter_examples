import 'package:flutter/material.dart';

class CryptoListPage extends StatefulWidget {
  @override
  _CryptoListPageState createState() => new _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  List currencies = [1,2];

  @override
  Widget build(BuildContext context) {
    return CryptoListState(
      child: Container(
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
              child: ListView.builder(
                itemCount: currencies.length,
                itemBuilder: (context,index){
//                  final Map currency = currencies[index];
                  print('>>>>generate cell');
                  return Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      child: ListTile(
                        title: Text('aaa'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      currencies: currencies,
      refresh: refresh,
      getMore: getMore,
    );
  }

  Future refresh() async {}

  Future getMore() async {}
}

class CryptoListState extends InheritedWidget {
  CryptoListState(
      {Key key, Widget child, this.currencies, this.refresh, this.getMore})
      : super(key: key, child: child);

  final List currencies;

  final Function refresh;

  final Function getMore;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }
}
