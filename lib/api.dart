// 模拟http的异步api

String _userName = 'Tom';
const _delaySec = 1;

Future<String> load() async {
  await new Future.delayed(const Duration(seconds: _delaySec));
  return _userName;
}

Future<String> update() async {
  await new Future.delayed(const Duration(seconds: _delaySec));
  if (_userName == 'Tom') {
    _userName = 'Joe';
  } else {
    _userName = 'Tom';
  }
  return 'OK';
}
