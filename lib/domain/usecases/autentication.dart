import 'package:equatable/equatable.dart';

abstract class Authentication {
  Future<void> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String? cpf;
  final String? cnpj;
  final String password;

  @override
  List<Object> get props => [password];

  const AuthenticationParams(
      {required this.cpf, required this.cnpj, required this.password});
}
