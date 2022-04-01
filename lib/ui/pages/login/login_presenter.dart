abstract class LoginPresenter {
  Stream<String>? get cpfErrorStream;
  Stream<String>? get cnpjErrorStream;
  Stream<String>? get passwordErrorStream;

  void validadeCPF(String? cpf);
  void validadeCNPJ(String? cpf);
  void validadePassword(String? password);

  void login();
  void goToPage();
}
