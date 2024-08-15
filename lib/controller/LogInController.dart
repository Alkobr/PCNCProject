import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Logincontroller extends GetxController {
  final box = GetStorage();
  String? _email;
  String? _password;
  bool obscureText = true;

  void updateEmail(String email) {
    _email = email;
    update();
  }

  void updatePassword(String password) {
    _password = password;
    update();
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    update();
  }

  void saveLoginData(String email, String password) {
    box.write('email', email);
    box.write('password', password);
  }

  String? getEmail() {
    return box.read('email');
  }

  String? getPassword() {
    return box.read('password');
  }

  void logout() {
    box.erase();
  }

  Future<void> login() async {
    if (_email == null || _password == null) {
      Get.snackbar("Error", "Please enter email and password");
      return;
    }

    try {
      final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/users'));

      if (response.statusCode == 200) {
        final users = json.decode(response.body) as List<dynamic>;

        final user = users.firstWhere(
          (user) => user['email'] == _email && user['password'] == _password,
          orElse: () => null,
        );

        if (user != null) {
          saveLoginData(_email!, _password!);  // Save login data for future sessions
          Get.snackbar("Success", "Login successful");
          Get.toNamed('/Home');
        } else {
          Get.snackbar("Error", "Invalid email or password");
        }
      } else {
        Get.snackbar("Error", "Failed to connect to the server");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  void checkLoginStatus() {
    String? savedEmail = getEmail();
    String? savedPassword = getPassword();

    if (savedEmail != null && savedPassword != null) {
      // Automatically log in the user if credentials are saved
      _email = savedEmail;
      _password = savedPassword;
      login();
    } else {
      // Redirect to login page if no credentials are found
      Get.toNamed('/LogIn');
    }
  }
}
