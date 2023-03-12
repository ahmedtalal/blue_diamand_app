import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetHandling {
  static InternetHandling? _internetHandling;
  InternetHandling._internal();
  static InternetHandling instance() {
    if (_internetHandling == null) {
      return _internetHandling = InternetHandling._internal();
    }
    return _internetHandling!;
  }

  checkConnection() {
    StreamSubscription subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async{
          bool isConnect = await InternetConnectionChecker().hasConnection;
        });
  }
}
