import 'package:clean_architecture/core/error/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output>> call(Input input);
}
