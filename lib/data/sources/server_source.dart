import 'dart:convert';
import 'dart:io';
import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/data/data.dart';
import 'package:http/http.dart' as http;

abstract class ServerSource {
  Future<List<ItemModel>> findItems();
  Future<ItemModel?> findItemById(int id);
}

class ServerSourceImp implements ServerSource {
  final http.Client client;

  const ServerSourceImp({
    required this.client,
  });

  @override
  Future<List<ItemModel>> findItems() async {
    try {
      http.Response response =
          await client.get(Uri.parse(NetworkPath.findItems));
      if (response.statusCode == 200) {
        List<ItemModel> result = (jsonDecode(response.body) as List)
            .map((item) => ItemModel.fromJson(item))
            .toList();
        return result;
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }

  @override
  Future<ItemModel?> findItemById(int id) async {
    try {
      http.Response response =
          await client.get(Uri.parse(NetworkPath.findItemById(id)));
      if (response.statusCode == 200) {
        ItemModel result = ItemModel.fromJson(jsonDecode(response.body));
        return result;
      } else if (response.statusCode == 403 || response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 404) {
        throw ItemNotFoundException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
