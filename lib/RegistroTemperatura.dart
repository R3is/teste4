import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';
import 'package:teste4/conversor.dart';

class RegistroTEMP extends StatefulWidget {
  @override
  State<RegistroTEMP> createState() => _RegistroTEMPState();
}

class _RegistroTEMPState extends State<RegistroTEMP> {
  String nome = '';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
                 icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home(),));
                },
              ),
        centerTitle: true,
         title: const Text('Minhas Conversões de Temperatura!'),
       ),
      body:Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: Column(
            children: <Widget>[
            ],
          ),
        ),
      ),
    );
  }
}