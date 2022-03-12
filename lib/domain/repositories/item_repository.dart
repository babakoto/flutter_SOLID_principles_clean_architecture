import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/domain/entities/item.dart';

abstract class ItemRepository {
  Future<Result<Failure, List<Item>>> findItems();
  Future<Result<Failure, Item?>> findItemById(int id);
  Future<Result<Failure, Item?>> addItem(String name);
}
