import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/utils/network_path.dart';
import 'package:clean_architecture/data/models/item_model.dart';
import 'package:http/http.dart' as http;

abstract class ServerSource {
  Future<List<ItemModel>> findItems();
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
      } else if (response.statusCode == 403 || response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ServerException();
    }
  }
}
