part of 'item_bloc.dart';

enum Status { empty, loading, loaded, serverError, networkError, itemNotFound }

class ItemState extends Equatable {
  final Status status;
  final List<Item> items;
  final Item? itemSelected;

  const ItemState(
      {required this.status, required this.items, this.itemSelected});

  @override
  List<Object> get props => [
        status,
      ];

  ItemState copyWith({
    Status? status,
    List<Item>? items,
    Item? itemSelected,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      itemSelected: itemSelected ?? this.itemSelected,
    );
  }
}
