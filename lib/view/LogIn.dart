import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pcnc/controller/LogInController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  Logincontroller logincontroller = Get.put(Logincontroller());
  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 150,
              child: const Text(
                "Welcome \nBack!",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Montserrat"),
              )),
          Form(
              child: Column(
            children: [
              GetBuilder<Logincontroller>(
                  builder: (context) => TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Username or Email",
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          iconColor: Color.fromARGB(255, 168, 168, 169),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          fillColor: Color.fromARGB(66, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                          logincontroller.updateEmail(val);
                        },
                        validator: (value) {
                          return value!.isEmpty ? "Please Enter Email" : null;
                        },
                      )),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<Logincontroller>(
                  builder: (context) => TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: obscuretext,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                          ),
                          iconColor: const Color.fromARGB(66, 168, 168, 169),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscuretext = !obscuretext;
                                });
                              },
                              icon: Icon(obscuretext
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          fillColor: const Color.fromARGB(66, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                          logincontroller.updatePassword(val);
                        },
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please Enter Password"
                              : null;
                        },
                      )),
            ],
          )),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Get.toNamed("/ForgetPage");
                  },
                  child: const Text(
                    "ForgetPassword?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ))),
          const SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                  width: 400,
                  child: MaterialButton(
                      padding: const EdgeInsets.all(15),
                      color: Colors.orange,
                      onPressed: () {
                        logincontroller.login();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )))),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create An Account",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(215, 51, 50, 50)),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed("/SignUp");
                  },
                  child: const Text(
                    "SignUp",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
