import 'dart:async';
import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final FindItemsUseCase findItemsUseCase;
  ItemBloc({required this.findItemsUseCase})
      : super(const ItemState(status: Status.empty, items: [])) {
    on<ItemOnFinds>(_onFindItems);
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
}
