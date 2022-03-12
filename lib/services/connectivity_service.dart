import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen(connectivityStream.add);
  }
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();
}
