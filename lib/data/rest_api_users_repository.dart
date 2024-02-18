import 'package:edugated/data/user_json.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/users_list_failure.dart';
import 'package:edugated/domain/repositories/users_repository.dart';
import 'package:edugated/network/network.dart';
import 'package:fpdart/fpdart.dart';

class RestApiUsersRepository implements UsersRepository {
  final Network _network;
  

  RestApiUsersRepository(this._network);

  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() =>
      _network.get('https://jsonplaceholder.typicode.com/users').then(
            (value) => value.fold(
              (l) => left(UsersListFailure(error: l.error)),
              (r) {
                var list = r as List;
                return right(
                    list.map((e) => UserJson.fromJson(e).toDomain()).toList());
              },
            ),
          );
}
