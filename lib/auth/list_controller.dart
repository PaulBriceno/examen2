import 'package:examen_paul_briceno/model/todo_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:examen_paul_briceno/auth/login_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListController extends GetxController { 
TextEditingController dato = TextEditingController();


TextEditingController nombre = TextEditingController();

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;
final RxList<TodoModel> datos = RxList<TodoModel>([]);

 final todoList = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTodo();
  }
 
//textoIngresado
    void addTextoDB() async { //Tipo 1
    var newTodo = TodoModel(
      nombre: nombre.text,
    );
    try {
      await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("categoria")
        .add(newTodo.toJson());//title.text
        //.add({"nombre": dato});//title.text
        nombre.clear;
        getTodo();
    } on Exception catch (e) {
        print(e.toString());
    }
  } 

void getTodo() async {
  var data = await db
  .collection("users")
  .doc(auth.currentUser!.uid)
  .collection("categoria")
  .get();
  todoList.clear();
  for(var todo in data.docs){
    todoList.add(TodoModel.fromJson(todo.data()));
  }

}

void deleteNotes(String id) async {
  try {
    QuerySnapshot querySnapshot = await db
    .collection("users")
    .doc(auth.currentUser!.uid)
    .collection("categoria")
    .get();
    for (var documentSnapshot in querySnapshot.docs){
      await documentSnapshot.reference.delete();
    }
    datos.removeWhere((dato)=>dato.nombre==id);
    for (var dato in datos) {
      await db.collection("users").add(dato.toJson());
      print(dato);
     }
  } catch (e) {
    print("Error deleting");
  }
  
  
}


}