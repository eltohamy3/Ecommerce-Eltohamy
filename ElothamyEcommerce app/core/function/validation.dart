bool isValidEmail(String email) {
  // Regular expression for validating an email
  final RegExp regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  return regex.hasMatch(email);
}

bool checkLength(String str) {
  return str.length < 8;
}

bool checkNullandEmpty(String? val) {
  return (val == null || val.isEmpty);
}

String? CheckEmpty(String? val) {
  if (checkNullandEmpty(val)) {
    return "Can`t be empty";
  }
  return null;
}

String? checkDiscount(String? val) {
  if (checkNullandEmpty(val)) {
    return "Can`t be empty";
  }
  int myval = int.parse(val!);
  if (myval < 0 || myval > 100) {
    return "the discount Should be between 0 and 100";
  }
  return null; 
}

String? Emailvalidate(String? email) {
  if (checkNullandEmpty(email)) {
    return 'Email cannot be empty';
  }
  if (!isValidEmail(email!)) {
    return 'Enter a valid email';
  }
  return null;
}

String? passwordSignUpValidate(String? password) {
  if (checkNullandEmpty(password)) {
    return 'Password cannot be empty';
  }
  if (password!.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  final RegExp hasUpper = RegExp(r'[A-Z]');
  final RegExp hasLower = RegExp(r'[a-z]');
  final RegExp hasDigit = RegExp(r'\d');
  final RegExp hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  if (!hasUpper.hasMatch(password)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!hasLower.hasMatch(password)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!hasDigit.hasMatch(password)) {
    return 'Password must contain at least one digit';
  }
  if (!hasSpecial.hasMatch(password)) {
    return 'Password must contain at least one special character';
  }
  return null;
}
