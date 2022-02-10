import 'package:clean_architecture/core/utils/hive_keys.dart';
import 'package:clean_architecture/data/models/item_model.dart';
import 'package:hive/hive.dart';

abstract class LocalSource {
  Future<List<ItemModel>> findItems();
}

class LocalSourceImp implements LocalSource {
  @override
  Future<List<ItemModel>> findItems() async {
    // FAKE DATA OFFLINE
    return Future.value([
      const ItemModel(id: 0, name: "Data Local"),
      const ItemModel(id: 1, name: "Data Local")
    ]);
  }
}
