import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegistroIMC extends StatefulWidget {
  @override
  State<RegistroIMC> createState() => _RegistroIMCState();
}

class _RegistroIMCState extends State<RegistroIMC> {
  String nome = '';
  TextEditingController controllerAltura = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  String calculo = "" ;

  final FirebaseFirestore _firebase =FirebaseFirestore.instance;

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
        title: const Text('Meus Calculos IMC!'),
      ),
      body:Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          )
        ),
      );
  }
}