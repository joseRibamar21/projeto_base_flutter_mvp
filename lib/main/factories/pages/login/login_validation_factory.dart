import '../../../../presenter/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../../validation/validators/validators.dart';
import '../../../builders/builders.dart';

Validation makeLoginValidation() {
  return ValidationComposite(_makeValidations());
}

List<FieldValidation> _makeValidations() {
  return [
    ...ValidationBuilder.field('cpf')!.required().email().build(),
    ...ValidationBuilder.field('password')!.required().build()
  ];
}
