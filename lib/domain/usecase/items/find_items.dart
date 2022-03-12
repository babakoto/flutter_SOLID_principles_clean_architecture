import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/core/utils/generics/usecase.dart';
import 'package:clean_architecture/domain/entities/item.dart';
import 'package:clean_architecture/domain/repositories/item_repository.dart';
import 'package:equatable/equatable.dart';

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
