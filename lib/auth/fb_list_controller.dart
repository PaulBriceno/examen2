import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_paul_briceno/model/todo_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//class FbListController {
class FirestoreService {
  //obtenemos la coleccion de la bd
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  final CollectionReference proveedor = FirebaseFirestore.instance.collection('proveedor');
  final CollectionReference categoria = FirebaseFirestore.instance.collection('categoria');
  final CollectionReference productos = FirebaseFirestore.instance.collection('productos');
  
TextEditingController title = TextEditingController();
TextEditingController nombre = TextEditingController();

 final db = FirebaseFirestore.instance;
 final auth = FirebaseAuth.instance;
  
 final todoList = <TodoModel>[].obs;

 
    Stream<QuerySnapshot> getNotesStream(){
      final notesStream = notes.snapshots();
        //notes.orderBy('note',descending: false).snapshots();
      return notesStream;
    } 

    Stream<QuerySnapshot> getProductosStream(){
      final productosStream = productos.snapshots();
      return productosStream;
    }

        Stream<QuerySnapshot> getProveedorStream(){
      final proveedorStream = proveedor.snapshots();
      return proveedorStream;
    }

        Stream<QuerySnapshot> getCategoriaStream(){
      final categoriaStream = categoria.snapshots();
      return categoriaStream;
    }

  //Crear elemento
  Future addNote(String dato,String tipo){ //Tipo 1
    switch (tipo) {
      case 'proveedor':
        //final CollectionReference tipo = FirebaseFirestore.instance.collection(tabla);
        return proveedor.add({'proveedor': dato,});
      case 'categoria':
        //final CollectionReference tipo = FirebaseFirestore.instance.collection(tabla);
        return categoria.add({'categoria': dato,});
      case 'productos':
       // final CollectionReference tipo = FirebaseFirestore.instance.collection(tabla);
        return productos.add({'productos': dato,});
      default:
        return notes.add({'notes': dato,});
    }  
  }  


/* 
    void addTextoDB(String dato) async { //Tipo 1
    var newTodo = TodoModel(
      nombre: nombre.text,
    );
    try {
      await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("productos")
        .add(newTodo.toJson());//title.text
        //.add({"nombre": dato});//title.text
    } on Exception catch (e) {
        print(e.toString());
    }
  } 
 */
  //Leer
 /*  Stream<QuerySnapshot> getDatosStream(){
    final datosStream = 
      datos.orderBy('nombre',descending: true).snapshots();
    
    return datosStream;
  }
 */


   //Actualizar

  Future<void> updateNote(String docID, String newNote,String tipo){
    switch (tipo) {
      case 'proveedor':
        return proveedor.doc(docID).update({'proveedor': newNote,});
      case 'categoria':
        return categoria.doc(docID).update({'categoria': newNote,});
      case 'productos':
       return productos.doc(docID).update({'productos': newNote,});
      default:
        return notes.doc(docID).update({'notes': newNote,});
      }  

  }
  //Borrar

   Future<void> deleteNote(String docID,String tipo){
    switch (tipo) {
      case 'proveedor':
        return proveedor.doc(docID).delete();
      case 'categoria':
        return categoria.doc(docID).delete();
      case 'productos':
       return productos.doc(docID).delete();
      default:
        return notes.doc(docID).delete();
      }  
    }
 

}