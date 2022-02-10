import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/domain/entities/item.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ItemRepository {
  Future<Result<Failure, List<Item>>> findItems();
}
