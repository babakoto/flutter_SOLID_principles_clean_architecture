import 'package:clean_architecture/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({required int id, required String name})
      : super(id: id, name: name);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(id: json["id"], name: json["name"]);
  }
}
