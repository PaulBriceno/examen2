import 'package:flutter/material.dart';

class Test extends StatelessWidget {

  const Test({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo Test'),
      ),
      body: const Center(
        child: Text('Prueba'),
      )
    );
  }
}
