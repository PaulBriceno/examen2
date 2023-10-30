import 'package:flutter/material.dart';

class Prueba extends StatelessWidget {

  const Prueba({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(
          title: const Text('prueba'),
          centerTitle: true,
          elevation: 15,
          shadowColor: Colors.orangeAccent,
          backgroundColor: Color.fromARGB(255, 223, 129, 14),
          //leading: const Icon(Icons.add_shopping_cart),
          //leading: const Icon(Icons.all_inbox),
          leading: const Icon(Icons.supervisor_account),
          leadingWidth: 100,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Cerrar sesion',
              highlightColor: Colors.orange,
              onPressed: 
              //() => print('SALIR'),
              (){
                //loginController.logOut();
              }            
            ),
          ],
          ),
          body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 100,),
              Container(// Full width button 1
                width: double.infinity,
                color: Colors.transparent,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.supervisor_account),
                  label: const Text('Prooveedores')),
              ),
              const SizedBox(height: 20,),
              Container(// Full width button 2
                width: double.infinity,
                color: Colors.transparent,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.all_inbox),
                  label: const Text('Categorias')),
              ),
              const SizedBox(height: 20,),
              Container(// Full width button 3
                width: double.infinity,
                color: Colors.transparent,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Productos')),
              ),
            ],
          ),
        ),
      );
    }
}