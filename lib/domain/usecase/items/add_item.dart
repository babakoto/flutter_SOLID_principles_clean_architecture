import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/utils/generics/usecase.dart';
import 'package:clean_architecture/core/utils/multiple_result.dart';
import 'package:clean_architecture/domain/domain.dart';

class AddItem implements UseCase<Item, String> {
  final ItemRepository repository;

  const AddItem({
    required this.repository,
  });

  @override
  Future<Result<Failure, Item?>> call(String input) async {
    return repository.addItem(input);
  }
}
