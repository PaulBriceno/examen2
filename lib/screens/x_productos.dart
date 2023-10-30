/* import 'package:examen_paul_briceno/auth/list_controller.dart';
import 'package:examen_paul_briceno/widgets/boton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:examen_paul_briceno/auth/login_controller.dart';
import 'package:get/get.dart';
//import 'package:examen_paul_briceno/auth/fb_list_controller.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class MCategoriasScreen extends StatefulWidget {

  const MCategoriasScreen({ super.key });

  @override
  State<MCategoriasScreen> createState() => _MCategoriasScreenState();
}

class _MCategoriasScreenState extends State<MCategoriasScreen> {
ListController listController = Get.put(ListController());
final user = FirebaseAuth.instance.currentUser!;

  @override
   Widget build(BuildContext context) {
      LoginController loginController = Get.put(LoginController());
       return Scaffold(
          appBar: AppBar(
          title: const Text('Categorias',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, letterSpacing: 1.5,color: Colors.black54)),
          centerTitle: true,
          elevation: 15,
          shadowColor: Colors.greenAccent,
          backgroundColor: Colors.green,
          leading: const Icon(
            Icons.all_inbox,
            color: Colors.black54,),
          leadingWidth: 100,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white70,
              tooltip: 'Cerrar sesion',
              highlightColor: Colors.orange,
              onPressed: 
              (){loginController.logOut();}            
            ),
          ],
          ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Proveedor",//"Agregar proveedor",
                content: Column(
                  children: [
                    Row(
                      children: [
                          //Expanded(child: TextField(),)
                        Expanded(child: TextFormField(
                          controller: listController.nombre,
                          decoration: InputDecoration(
                          //labelText: 'Proveedor',
                          hintText: 'ingresa un proveedor',
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 3),),
                          ),
                         style: TextStyle(fontSize: 20),
                        ),
                       ),
                      ],
                    )
                  ],
                ),
                titlePadding: EdgeInsets.all(10),
                contentPadding: EdgeInsets.all(10),
                radius: 15,
                actions: [
                    MaterialButton(
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white70,
                      onPressed: () {
                        Get.back();
                      }, 
                      child: Text('Cancelar',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),
                    ),
                    MaterialButton(
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white,
                      onPressed: (){
                        listController.addTextoDB();
                        Get.back();
                      }, 
                      child: Text('Agregar',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)))
                  ],
                backgroundColor: Colors.white,//color de fondo del cuadro de dialogo  
              );
          },
          backgroundColor: Colors.amber,//color de fondo del boton agregar
          child: const Icon(Icons.add)),        
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          bottomNavigationBar:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BotonMenu(
                icon: Icons.backspace_outlined,
                tcolor: Colors.green,
                btname: "Volver",
                ontap: () {Get.offAllNamed("/home");}
              ),
          ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////          
          body:Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: Obx(() => SingleChildScrollView(
                    child: Column(
                    children: listController.todoList
                    .map((e)=>Column(
                      children: [
                        ListTile(
                        tileColor: Colors.white,
                        onTap: () {},
                        leading: Icon(Icons.task),
                        title: Text(
                          e.nombre.toString(),
                        ),
                        trailing: InkWell(
                          child: Icon(Icons.delete),
                          onTap: () {
                            print(e.nombre.toString());
                            listController.deleteNotes(e.nombre.toString());
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      ],
                    )).toList(),
                    ),
                  ),)
                  ),
              ],
            ),
          )

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
    );       
  }
} */