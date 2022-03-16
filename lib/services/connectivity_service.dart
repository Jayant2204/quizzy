import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final connectivityStream = Connectivity().onConnectivityChanged;
}
