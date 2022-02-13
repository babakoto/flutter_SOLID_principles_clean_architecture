import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Network {
  Future<bool> hasConnexion();
}

class NetworkImp implements Network {
  final InternetConnectionChecker checker;

  const NetworkImp({
    required this.checker,
  });

  @override
  Future<bool> hasConnexion() async {
    final state = await checker.hasConnection;
    if (state) {
      return true;
    } else {
      return false;
    }
  }
}
