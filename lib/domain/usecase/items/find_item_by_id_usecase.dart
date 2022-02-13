import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/domain.dart';

class FindItemByIdUseCase implements UseCase<Item, int> {
  final ItemRepository repository;

  FindItemByIdUseCase({required this.repository});

  @override
  Future<Result<Failure, Item?>> call(int input) async {
    return repository.findItemById(input);
  }
}
