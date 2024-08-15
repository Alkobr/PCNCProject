import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pcnc/controller/SignUpController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final Signupcontroller signupController = Get.put(Signupcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(left: 30, top: 70, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 150,
                  child: const Text(
                    "Create an \naccount",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        color: Colors.black),
                  )),
              Form(
                  child: Column(
                children: [
                  GetBuilder<Signupcontroller>(
                    builder: (_) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide()),
                          fillColor: Color.fromARGB(82, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                          signupController.userNameSave(val);
                        },
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please Enter Username"
                              : null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<Signupcontroller>(
                    builder: (_) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 30,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          fillColor: Color.fromARGB(82, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                          signupController.emailSaved(val);
                        },
                        validator: (value) {
                          return value!.isEmpty ? "Please Enter Email" : null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<Signupcontroller>(
                    builder: (_) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: signupController.obscureText1,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                signupController.toggleObscureText1();
                              },
                              icon: Icon(signupController.obscureText1
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          fillColor: const Color.fromARGB(82, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                          signupController.passwordSaved(val);
                        },
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please Enter Password"
                              : null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<Signupcontroller>(
                    builder: (_) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: signupController.obscureText2,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 30,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                signupController.toggleObscureText2();
                              },
                              icon: Icon(signupController.obscureText2
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 216, 212, 212))),
                          fillColor: const Color.fromARGB(82, 168, 168, 169),
                          filled: true,
                        ),
                        onChanged: (val) {
                        signupController.confirmPassword(val);
                        },
                        validator: (value) {
                          return value!.isEmpty
                              ? "Please Enter Password"
                              : null;
                        },
                      );
                    },
                  ),
                ],
              )),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: const TextSpan(
                      text: "By clicking the ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 137, 134, 134)),
                      children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    TextSpan(
                        text: " button, you agree to the public offer.",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 137, 134, 134)))
                  ])),
              const SizedBox(
                height: 90,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 400,
                      child: MaterialButton(
                          padding: const EdgeInsets.all(10),
                          color: Colors.orange,
                          onPressed: () {
                            
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I Already Have an Account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/LogIn");
                      },
                      child: const Text(
                        "LogIn",
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
