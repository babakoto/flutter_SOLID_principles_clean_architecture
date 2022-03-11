part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class ItemOnFinds extends ItemEvent {}

class ItemOnFindItemById extends ItemEvent {
  final int id;

  const ItemOnFindItemById({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
