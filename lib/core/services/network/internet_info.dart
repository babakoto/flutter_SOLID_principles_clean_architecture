import 'package:clean_architecture/core/services/network/network.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetInfoImp implements InternetInfo {
  final InternetConnectionChecker checker;

  const InternetInfoImp({
    required this.checker,
  });

  @override
  Future<bool> hasConnexion() => checker.hasConnection;
}
