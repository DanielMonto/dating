import 'dart:async';

import 'package:flutter/material.dart';

class GlobalTimer with ChangeNotifier {
  DateTime now = DateTime.now();
  late Timer _timer;
  GlobalTimer() {
    _startTimer();
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      now = DateTime.now();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
