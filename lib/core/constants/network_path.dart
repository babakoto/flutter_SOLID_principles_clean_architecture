abstract class NetworkPath {
  static const String _host = "http://10.0.2.2:3000";
  static String items = "$_host/items";
  static String findItemById(int id) => NetworkPath.items + "/$id";
}
