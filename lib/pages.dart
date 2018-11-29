import 'package:flutter/material.dart';
import 'package:flutter_examples/state.dart';

class ShowInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = MyState.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('信息展示'),
      ),
      body: Center(
        child: Text('Hello world, ${state.userName}'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('编辑'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditInfoPage()));
          }),
    );
  }
}

class EditInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = MyState.of(context);
    return Scaffold(
      body: Center(
        child: Text('User name: ${state.userName}'),
      ),
      appBar: AppBar(
        title: Text('信息编辑'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('改变'),
        onPressed: () {
          var userName = 'Smith';
          if (state.userName == 'Smith') {
            userName = 'Newton';
          }
          state.update(userName: userName);
        },
      ),
    );
  }
}