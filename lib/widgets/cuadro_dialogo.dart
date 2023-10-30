import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/* 
class CuadroDialogo extends StatelessWidget {
  final IconData icon;
  final Color  tcolor;
  final String btname;
  final VoidCallback ontap;
  const CuadroDialogo({super.key, required this.icon, required this.tcolor, required this.btname, required this.ontap});
  
  //const CuadroDialogook({ super.key });

   @override
   Widget build(BuildContext context) {
    return InkWell(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.deepOrange,
              color: tcolor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(icon,size: 40,color:  Colors.white38,),
                const SizedBox(width: 10),
                Text(
                  btname,
                  style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold, letterSpacing: 1.5,color: Colors.black54),
                )
              ],
            ),
          ),
        );
  }
}

//////////////////////////////////////////////////////////////////////////
void cuadrodial(){
  Get.defaultDialog(
    title: "Ingresa texto",
    content: Column(
      children: [
        Row(
          children: [
            Expanded(child: TextField(),)
          ],
        )
      ],
    ),
    titlePadding: EdgeInsets.all(10),
    contentPadding: EdgeInsets.all(10),
    radius: 10,
    actions: [
      OutlinedButton(
        onPressed: () {
          Get.back();
        }, 
        child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: (){
            Get.back();
          }, 
          child: Text('Agregar'))
    ],
    backgroundColor: Colors.white,
  );

}



//  InkWell(
//                 onTap: () {
                  
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
//                   decoration: BoxDecoration(color: Colors.brown,
//                   borderRadius: BorderRadius.circular(10),
//                 ),

//                 ),
//               )

 */