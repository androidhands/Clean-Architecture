import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
@immutable
abstract class Failure extends Equatable{
  const Failure([List properties = const<dynamic>[]]):super();
}

class ServerFailure extends Failure{
  final String message;
  const ServerFailure(this.message);
  @override
  List<Object> get props => [message];
}
class CacheFailure extends Failure{
  final String message;
 const CacheFailure(this.message);
  @override
  List<Object> get props => [message];
}