import 'package:examen_paul_briceno/auth/login_controller.dart';
import 'package:examen_paul_briceno/widgets/boton.dart';
import 'package:examen_paul_briceno/widgets/campo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("L O G I N"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              const Row(
                children: [
                  Text(
                    "Welcome back",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Campo(
                icons: Icons.email,
                lable: "Email id",
                Onchange: loginController.email,
              ),
              const SizedBox(height: 10),
              Campo(
                icons: Icons.password,
                lable: "Password",
                Onchange: loginController.password,
              ),
              const SizedBox(height: 20),
              BotonMenu(
                icon: Icons.admin_panel_settings_rounded,
                tcolor: Colors.green,
                btname: "LOGIN",
                ontap: () {
                  loginController.onLogin();
                },
              ),
              const SizedBox(height: 20),
              BotonMenu(
                icon: Icons.person_add,
                tcolor: Colors.blueAccent,
                btname: "SIGN UP",
                ontap: () {
                  Get.offAllNamed('/signup');
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}