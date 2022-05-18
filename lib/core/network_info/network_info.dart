


import 'package:data_connection_checker/data_connection_checker.dart';

abstract class PlatformNetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements PlatformNetworkInfo{
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected  => dataConnectionChecker.hasConnection;
}