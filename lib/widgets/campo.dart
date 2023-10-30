//import 'package:examen_paul_briceno/config/colors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

const Color lightWhiteColor = Color(0xFFFFFFFF);

class Campo extends StatelessWidget {
  final String lable;
  final IconData icons;
  final TextEditingController Onchange;
  const Campo({super.key, required this.lable, required this.icons, required this.Onchange});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: Onchange,
            decoration: InputDecoration(
              prefixIcon: Icon(icons),
              fillColor: lightWhiteColor,
              filled: true,
              hintText: lable,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
  }
} 
