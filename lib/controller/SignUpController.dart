import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Signupcontroller extends GetxController {
  String? _username;
  String? _password;
  String? _email;
  String? _confirmPassword;
  bool obscureText1 = true;
  bool obscureText2 = true;

  void userNameSave(String userName) {
    _username = userName;
    update();
  }

  void passwordSaved(String password) {
    _password = password;
    update();
  }

  void emailSaved(String email) {
    _email = email;
    update();
  }

  void confirmPassword(String password) {
    _confirmPassword = password;
    update();
  }

  bool checkConformPassword() {
    return _password == _confirmPassword;
  }

  void toggleObscureText1() {
    obscureText1 = !obscureText1;
    update();
  }

  void toggleObscureText2() {
    obscureText2 = !obscureText2;
    update();
  }

  bool checkEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool checkPassword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  Future<void> signUp() async {
    if (_email == null ||
        _password == null ||
        _username == null ||
        _confirmPassword == null) {
      Get.snackbar("Error", "Please enter all the required fields");
      return;
    }

    if (!checkEmail(_email!)) {
      Get.snackbar("Error", "Invalid email format");
      return;
    }

    if (!checkPassword(_password!)) {
      Get.snackbar("Error",
          "Password must be at least 8 characters, include an uppercase letter, a lowercase letter, a number, and a special character");
      return;
    }

    if (!checkConformPassword()) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/users/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "name": _username,
          "email": _email,
          "password": _password,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Signup successful");
        Get.toNamed('/Home');
      } else {
        final error = json.decode(response.body);
        Get.snackbar("Error", error['message'] ?? "Signup failed");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
