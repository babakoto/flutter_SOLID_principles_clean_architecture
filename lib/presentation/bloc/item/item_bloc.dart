import 'dart:async';
import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final FindItemsUseCase findItemsUseCase;
  final FindItemById findItemByIdUseCase;

  ItemBloc({required this.findItemsUseCase, required this.findItemByIdUseCase})
      : super(const ItemState(status: Status.empty, items: [])) {
    on<ItemOnFinds>(_onFindItems);
    on<ItemOnFindItemById>(_onFindItemById);
  }

  Future<void> _onFindItems(ItemOnFinds event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await findItemsUseCase(NoInput());

    if (result.isSuccess()) {
      emit(state.copyWith(items: result.getSuccess(), status: Status.loaded));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      }
    }
  }

  Future<void> _onFindItemById(
      ItemOnFindItemById event, Emitter<ItemState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await findItemByIdUseCase(event.id);
    if (result.isSuccess()) {
      emit(state.copyWith(
          currentItem: result.getSuccess(), status: Status.loaded));
    } else {
      if (result.getError() is ServerFailure) {
        emit(state.copyWith(status: Status.serverError));
      } else if (result.getError() is NotConnectedFailure) {
        emit(state.copyWith(status: Status.networkError));
      } else if (result.getError() is ItemNotFoundFailure) {
        emit(state.copyWith(status: Status.itemNotFound));
      }
    }
  }
}
