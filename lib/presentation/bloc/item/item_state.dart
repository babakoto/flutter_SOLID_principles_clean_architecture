part of 'item_bloc.dart';

enum Status { empty, loading, loaded, serverError, networkError, itemNotFound }

class ItemState extends Equatable {
  final Status status;
  final List<Item> items;
  final Item? currentItem;

  const ItemState({
    required this.status,
    required this.items,
    this.currentItem,
  });

  @override
  List<Object?> get props => [status, items, currentItem];

  ItemState copyWith({
    Status? status,
    List<Item>? items,
    Item? currentItem,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      currentItem: currentItem ?? this.currentItem,
    );
  }
}
