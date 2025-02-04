import 'package:email_validator/email_validator.dart';

// alphanumeric
final alphanumericCharacters = RegExp(r'^(?!\s)[a-zA-Z0-9\s]+');

// alphabets with space only
final alphaCharacters = RegExp(r'[a-zA-Z][a-zA-Z\s]*');

//numbers only
final numberCharacter = RegExp('[0-9]');

final tenDigitsOnly =  RegExp(r'^\d{0,10}$');

//numbers with decimal
final numberWithDecimal = RegExp(r'^\d*\.?\d*$');

//password
const String passwordValidation =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

//common validator
String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value.endsWith(' ')) {
    return 'This field should not have white space in the end';
  }

  return null;
}

String? cashValidator({String? value, required double totalAmount}) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value.endsWith(' ')) {
    return 'This field should not have white space in the end';
  }
  if (double.parse(value) > totalAmount) {
    return 'Please enter valid amount';
  }

  return null;
}

String? accountNumberValidator(
  String? value, {
  required String accountNumber,
  required String confirmAccountNumber,
}) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (accountNumber != confirmAccountNumber) {
    return 'please make sure these are same';
  }
  if (value.endsWith(' ')) {
    return 'This field should not have white space in the end';
  }

  return null;
}

String? passwordValidator(String? input) {
  if (input == null || input.isEmpty) {
    return 'Please enter some text';
  }

  if (input.endsWith(' ')) {
    return 'This field should not have white space in the end';
  }

  if (input.length < 8 || input.length > 16) {
    return "";
  }
  return null;
}

String? emailValidator({required String value}) {
  final bool isValid = EmailValidator.validate(value);
  if (!isValid) {
    return 'please enter a valid email';
  }
  return null;
}
