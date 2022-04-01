import '../../../../presenter/presenter.dart';
import '../../../../ui/pages/pages.dart';
import 'login.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(validation: makeLoginValidation());
}
