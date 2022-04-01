import 'package:get/get.dart';

import '../../presenter/protocols/protocols.dart';
import '../../ui/pages/pages.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  final Validation validation;
  GetxLoginPresenter({required this.validation});

  Rx<String>? cpfError = Rx<String>("");
  final cnpjError = Rx<String>("");
  final passwordError = Rx<String>("");

  @override
  Stream<String>? get cpfErrorStream => cpfError?.stream;

  @override
  Stream<String> get cnpjErrorStream => cnpjError.stream;

  @override
  Stream<String> get passwordErrorStream => passwordError.stream;

  @override
  void goToPage() {}

  @override
  void login() {}

  @override
  void validadeCNPJ(String? cpf) {}

  @override
  void validadeCPF(String? cpf) {
    cpfError?.value = validation.validate(field: 'cpf', value: cpf.toString());
  }

  @override
  void validadePassword(String? password) {}
}
