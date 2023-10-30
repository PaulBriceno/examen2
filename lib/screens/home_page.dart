import 'package:examen_paul_briceno/auth/login_controller.dart';
import 'package:examen_paul_briceno/widgets/boton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color lightButtonColor = Color(0xFF246AFE);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('HOME',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, letterSpacing: 1.5,color: Colors.black54)),
          centerTitle: true,
          elevation: 15,
          shadowColor: const Color.fromARGB(255, 54, 54, 53),
          backgroundColor: const Color.fromARGB(255, 115, 115, 115),
          leading: 
          IconButton(onPressed: () {
            loginController.userDetails();
          }, icon: Icon(Icons.home),
            color: Colors.black54,
          ),
          leadingWidth: 100,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout), 
              color: Colors.white70,  
              tooltip: 'Cerrar sesion',
              highlightColor: Colors.orange,
              onPressed: 
              (){
                loginController.logOut();
              }            
            ),
          ],
        ),

  body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [

            const SizedBox(height: 100),
            
            BotonMenu(
              icon: Icons.supervisor_account,
              tcolor: Colors.deepOrangeAccent,
              btname: "PROVEEDORES",
              ontap: () {Get.offAllNamed("/MProveedoresScreen");}
            ),

            const SizedBox(height: 20),

            BotonMenu(
              icon: Icons.all_inbox,
              tcolor: Colors.green,
              btname: "CATEGORIAS",
              ontap: () {Get.offAllNamed("/MCategoriasScreen");}
            ),
            
            const SizedBox(height: 20),

            BotonMenu(
              icon: Icons.add_shopping_cart,
              tcolor: Colors.lightBlue,
              btname: "PRODUCTOS",
              ontap: () {Get.offAllNamed("/MProductosScreen");}
            ),

            ]),
          ),
        ),
      ),
    );
  }
}