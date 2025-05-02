import 'dart:async';

class Debounce {
  final Duration delay;
  Timer? _timer;
  Debounce({required this.delay});

  void call(void Function() callBack) {
    _timer?.cancel();
    _timer = Timer(delay, callBack);
  }

  void dispose() {
    _timer?.cancel();
  }
}
