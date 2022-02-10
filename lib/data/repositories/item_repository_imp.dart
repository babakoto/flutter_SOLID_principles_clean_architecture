import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/data/sources/local_source.dart';
import 'package:clean_architecture/data/sources/server_source.dart';
import 'package:clean_architecture/domain/entities/item.dart';
import 'package:clean_architecture/domain/repositories/item_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class ItemRepositoryImp implements ItemRepository {
  final ServerSource server;
  final LocalSource localSource;
  final Network network;

  const ItemRepositoryImp({
    required this.server,
    required this.localSource,
    required this.network,
  });

  @override
  Future<Result<Failure, List<Item>>> findItems() async {
    try {
      final result = await server.findItems();
      return Success(result);
    } on NotConnectedException {
      return Error(NotConnectedFailure());
    } on ServerException {
      return Error(ServerFailure());
    } on UnauthorizedException {
      return Error(UnauthorizedFailure());
    }
  }
}
