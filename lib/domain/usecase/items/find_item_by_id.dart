import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/core/utils/generics/usecase.dart';
import 'package:clean_architecture/domain/domain.dart';

class FindItemById implements UseCase<Item, int> {
  final ItemRepository repository;

  FindItemById({required this.repository});

  @override
  Future<Result<Failure, Item?>> call(int input) async {
    return repository.findItemById(input);
  }
}
