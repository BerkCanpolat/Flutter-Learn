Future<void> main() async {
  print('a');
  Future.forEach([1,2,3,4,5,6], (int element) async {
    await Future.delayed(Duration(seconds: 2));
    print('İşlem bitti $element');
  });
  await Future.delayed(Duration(seconds: 2));
  print('b');

  print('hello');
  Future.delayed(Duration(seconds: 0)).whenComplete(() {
    print('hello2');
  });
  print('hello3');
  Future.delayed(Duration(seconds: 0)).whenComplete(() {
    print('hello4');
  });

  Stream<int> bankMoneys = Stream.empty();
  bankMoneys.listen((event) {
    print(event);
  });
}

Stream<int> dataAddBankMoney(int retryCount, int money) async* {
  int _localRetry = 0;
  while(_localRetry < retryCount) {
    _localRetry++;
    yield money += 5;
  }
}

