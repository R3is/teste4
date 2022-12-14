import 'package:flutter/material.dart';
import 'package:teste4/Cadastro.dart';
import 'package:teste4/RegistroIMC.dart';
import 'package:teste4/RegistroTemperatura.dart';
import 'package:teste4/conversor.dart';
import 'package:teste4/Login.dart';
import 'package:teste4/calculadora.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'MYAPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHome();
}

class _MyHome extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Calculadora de IMC'),
              leading: Icon(Icons.accessibility),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () =>
                {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => calculadora())
                  )
                },
              ),

            ),
            ListTile(
              title: Text('Conversor de temperatura'),
              leading: Icon(Icons.ac_unit_sharp),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () =>
                {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const CalcConv()
                    ),),
                },
              ),
            ),
            ListTile(
              title: Text('Meus Calculos IMC!'),
              subtitle: Text('Ver meu histórico'),
              leading: Icon(Icons.access_alarm),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RegistroIMC()));
                },
              ),
            ),

            ListTile(
              title: Text('Minhas Conversões'),
              subtitle: Text('Ver meu histórico'),
              leading: Icon(Icons.access_alarm),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => RegistroTEMP()));
                },
              ),
            ),

            const SizedBox(
                height: 500,
                width: 120,
                child: Image(image: AssetImage("imagens/myapp.png"),fit: BoxFit.scaleDown)

            ),
          ],
        ),
      ),
    );
  }
}