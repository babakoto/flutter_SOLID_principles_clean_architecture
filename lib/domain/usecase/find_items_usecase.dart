import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/domain/entities/item.dart';
import 'package:clean_architecture/domain/repositories/item_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

class NoInput extends Equatable {
  @override
  List<Object> get props => [];
}

class FindItemsUseCase implements UseCase<List<Item>, NoInput> {
  final ItemRepository repository;

  const FindItemsUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, List<Item>>> call(NoInput input) {
    return repository.findItems();
  }
}
