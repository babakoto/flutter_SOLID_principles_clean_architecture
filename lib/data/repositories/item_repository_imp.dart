import 'package:clean_architecture/core/core.dart';
import 'package:clean_architecture/core/services/network/network.dart';
import 'package:clean_architecture/domain/domain.dart';
import '../data.dart';

class ItemRepositoryImp implements ItemRepository {
  final ServerSource server;
  final LocalSource localSource;
  final InternetInfo internetInfo;

  const ItemRepositoryImp({
    required this.server,
    required this.localSource,
    required this.internetInfo,
  });

  @override
  Future<Result<Failure, List<Item>>> findItems() async {
    try {
      if (await internetInfo.hasConnexion()) {
        final result = await server.findItems();
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Failure, Item?>> findItemById(int id) async {
    try {
      if (await internetInfo.hasConnexion()) {
        final result = await server.findItemById(id);
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    } on ItemNotFoundException {
      return Error(ItemNotFoundFailure());
    }
  }
}
