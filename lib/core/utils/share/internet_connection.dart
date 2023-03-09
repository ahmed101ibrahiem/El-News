

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}
class NetworkInfoImplement implements NetworkInfo{
  final InternetConnectionChecker internetConnection;

  NetworkInfoImplement({required this.internetConnection});

  @override
  // TODO: implement checkNet
  Future<bool> get isConnected => internetConnection.hasConnection;

}