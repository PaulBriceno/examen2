
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_paul_briceno/widgets/boton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:examen_paul_briceno/auth/login_controller.dart';
import 'package:examen_paul_briceno/auth/fb_list_controller.dart';
//import 'package:firebase_core/firebase_core.dart';

class MProductosScreen extends StatefulWidget {
  const MProductosScreen({ super.key });

  @override
  State<MProductosScreen> createState() => _MProductosScreenState();
}

class _MProductosScreenState extends State<MProductosScreen> {

var tipoBase = 'productos';


  final FirestoreService firestoreService = FirestoreService(); //Firestone
  TextEditingController textController = TextEditingController();  // creamos un textController
  
  void abrirDialogo({String? docID}){ //Abrimos un cuadro de dialogo
    showDialog(context: context, 
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        content: TextField(
          controller: textController,
          maxLength:9,
        ),
        actionsPadding: EdgeInsets.fromLTRB(100, 0, 100, 40),
        actions: [
          MaterialButton(
            onPressed: () {
              if (docID==null){//Validamos si el docID viene null
                firestoreService.addNote(textController.text,tipoBase);//Enviamos el dato a la bd 
              }
              else {//Actualizamos el dato
                firestoreService.updateNote(docID, textController.text,tipoBase);
              }
              textController.clear();//Limpiamos el texto del dialogo
              Navigator.pop(context);//Cerramos el cuadro de dialogo
            },
            color: Colors.lightBlueAccent,
            child: Text('Agregar',style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold,)))
        ],
      ),
    );  
}

@override
  void initState(){
  super.initState();
}

   @override
   Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
       return Scaffold(
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
          appBar: AppBar(
          title: Text(tipoBase.capitalizeFirst!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, letterSpacing: 1.5,color: Colors.black54)),
          centerTitle: true,
          elevation: 15,
          shadowColor: Colors.blueAccent,
          backgroundColor: Colors.lightBlue,
          leading: const Icon(
            Icons.add_shopping_cart,
            color: Colors.black54,),
          leadingWidth: 100,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white70,
              tooltip: 'Cerrar sesion',
              highlightColor: Colors.orange,
              onPressed: (){loginController.logOut();}           
            ),
          ],
          ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          floatingActionButton: FloatingActionButton(
            onPressed: abrirDialogo,
            backgroundColor: Colors.lightBlue,//color de fondo del boton agregar
            child: const Icon(Icons.add)
          ),
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////         
           bottomNavigationBar:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BotonMenu(
                  icon: Icons.backspace_outlined,
                  tcolor: Colors.lightBlue,
                  btname: "Volver",
                  ontap: () {Get.offAllNamed("/home");}
                ),
            ), 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
         body:SafeArea(child: Padding(padding: const EdgeInsets.all(10),
          child:Column(
            children: [
                  Expanded(child: 
                    StreamBuilder<QuerySnapshot>(
                        stream:  firestoreService.getProductosStream(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            List notesList= snapshot.data!.docs;
                            return ListView.builder(
                              itemCount: notesList.length,
                              itemBuilder: (context, index){

                              //Obtener datos individuales
                              DocumentSnapshot document = notesList[index];
                              String docID = document.id;
                              //Obtener un campo de cada dato.
                              Map<String, dynamic> data = 
                              document.data() as Map<String, dynamic>;
                              String noteText = data[tipoBase];
                              return Container(
                                   margin: const EdgeInsets.all(10),// Separacion entre elementos
                                   padding: const EdgeInsets.all(15),// Altura de elementos
                                   decoration: BoxDecoration(
                                     color: Colors.blueAccent,
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                  child: Row(
                            children: [
                                  Padding(   
                            padding: EdgeInsets.only(left: 10),   
                            child: Row(children: [
                              const Icon(
                                Icons.add_box_outlined,
                                color: Colors.white,
                                size: 30,
                                ),
                                SizedBox(width: 10,),
                            Text( noteText,style: const TextStyle(fontSize: 22,color: Colors.black87),),    
                            ],)
                  
                                ),
                            Expanded(child: Container()),
                            IconButton(onPressed:() => abrirDialogo(docID: docID),
                                      icon: Icon(Icons.edit),
                                      color: Colors.white70,
                                    ),
                            IconButton(onPressed:() => firestoreService.deleteNote(docID,tipoBase),
                                    icon: Icon(Icons.delete),
                                    color: Colors.white70,
                                    ),
                                ],
                            )
                          );         
                            },
                          );
                        }
                        //Si no hay datos no devuelve nada
                        else{
                          return Text("No hay datos...");
                        }
                      },
                    ), 
                  ),
                ],
             )
           )
          )
///////////Final archivo//////////////////////////////          
      );
   }
} 
