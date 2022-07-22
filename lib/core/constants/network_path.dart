

abstract class NetworkPath {
  static const String _host = "http://localhost:3000";
  static String items = "$_host/items";
  static String findItemById(int id) => "${NetworkPath.items}/$id";
}
