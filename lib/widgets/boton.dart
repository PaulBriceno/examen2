//import 'package:firebase_projects/config/colors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

const Color lightWhiteColor = Color(0xFFFFFFFF);
const Color lightButtonColor = Color(0xFF246AFE);



class Boton extends StatelessWidget {
  final IconData icon;
  final String Btname;
  final VoidCallback ontap;
  const Boton({super.key, required this.icon, required this.Btname, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightButtonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(
          icon,
              color: lightWhiteColor,
            ),
            SizedBox(width: 10),
            Text(
              Btname,
              style: TextStyle(
                fontSize: 18,
                color: lightWhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BotonMenu extends StatelessWidget {
  final IconData icon;
  final Color  tcolor;
  final String btname;
  final VoidCallback ontap;
  const BotonMenu({super.key, required this.icon, required this.tcolor, required this.btname, required this.ontap});

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
          children: [
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