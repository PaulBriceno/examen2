import 'package:examen_paul_briceno/auth/signup_controller.dart';
import 'package:examen_paul_briceno/widgets/boton.dart';
import 'package:examen_paul_briceno/widgets/campo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {

  const SignupScreen({ super.key });

   @override
   Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
      title: Text("REGISTRO"),
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
                    "Aqui puedes hacer tu",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "R E G I S T R O",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            //   const SizedBox(height: 10),
            //   Campo(
            //   icons: Icons.person,
            //   lable: "Enter name",
            //   Onchange: signupController.name,
            // ),
              const SizedBox(height: 10),
              Campo(
              icons: Icons.email,
              lable: "Email id",
              Onchange: signupController.email,
            ),
              const SizedBox(height: 10),
              Campo(
              icons: Icons.password,
              lable: "Password",
              Onchange: signupController.password,
            ),
            const SizedBox(height: 40),
            BotonMenu(
              icon: Icons.person_add,
              tcolor: Colors.blueAccent,
              btname: "SIGN UP",
              ontap: () {
                signupController.onSignUp();
                signupController.email.clear();
                signupController.password.clear();
              },
            ),
            const SizedBox(height: 20),
            BotonMenu(
              icon: Icons.admin_panel_settings_rounded,
              tcolor: Colors.green,
              btname: "LOGIN",
              ontap: () {
                Get.offAllNamed('/login');
                }
              )
            ]),
          ),
        ),
      ),
    );
  }
}