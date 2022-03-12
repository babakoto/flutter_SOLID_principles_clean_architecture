import 'package:clean_architecture/data/models/item_model.dart';

abstract class LocalSource {
  Future<List<ItemModel>> findItems();
}
