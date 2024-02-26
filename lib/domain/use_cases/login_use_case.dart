import 'package:edugated/domain/entities/login.dart';
import 'package:edugated/domain/entities/user.dart';
import 'package:edugated/domain/failures/login_failure.dart';
import 'package:edugated/domain/repositories/login_repository.dart';
import 'package:edugated/domain/validator/login_validator.dart';
import 'package:fpdart/fpdart.dart';

class LoginUseCase {
  final LoginRepository _repo;
  final LoginValidator _validator;

  LoginUseCase(this._repo, this._validator);

  Future<Either<LoginFailure, User>> exceute(Login login) async =>
      _validator.validate(login).fold(
          (err) => left(LoginFailure(error: err.error)),
          (data) async => await _repo.login(data).then((value) => value.fold(
              (err) => left(LoginFailure(error: err.error)),
              (response) => right(response))));
}
