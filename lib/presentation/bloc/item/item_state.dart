part of 'item_bloc.dart';

enum Status { empty, loading, loaded, serverError, networkError }

class ItemState extends Equatable {
  final Status status;
  final List<Item> items;

  const ItemState({required this.status, required this.items});

  @override
  List<Object> get props => [
        status,
      ];

  ItemState copyWith({
    Status? status,
    List<Item>? items,
  }) {
    return ItemState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }
}
