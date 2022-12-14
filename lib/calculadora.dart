import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';

void main() {
  runApp(const calculadora());
}

class calculadora extends StatelessWidget {
  const calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerAltura = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();
  String resultado = '';

  String? value;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: ()=>{
            Navigator.pop(context),
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home())),
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: controllerAltura,
                decoration: const InputDecoration(
                  hintText: "Altura cm",
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: controllerPeso,
                decoration: const InputDecoration(
                  hintText: "Peso kg",
                ),
              ),

              SizedBox(height: 50),
              Text(resultado, style: const TextStyle(fontSize: 25,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 15),
              Container(
                  child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          double Peso = double.parse(controllerPeso.text);
                          double Altura = double.parse(controllerAltura.text) / 100.0;
                          double imc = Peso / (Altura * Altura);
//Tabela de resultados para comparação
                          setState(() {
                            resultado = "imc = ${imc.toStringAsPrecision(2)}\n";
                            if (imc < 16)
                              resultado += "Magreza grave";
                            else if (imc < 17)
                              resultado += "Magreza moderada";
                            else if (imc < 18.5)
                              resultado += "Magreza Leve";
                            else if (imc < 25)
                              resultado += "Saudável";
                            else if (imc < 30)
                              resultado += "Sobrepeso";
                            else if (imc < 35)
                              resultado += "Obesidede Grau I";
                            else if (imc < 40)
                              resultado += "Obesidede Grau II (Severa)";
                            else
                              resultado += "Obesidede Grau III (Mórbida)";
                          });
                        });
                      },
                      child:const Text('Calcular'))
              ),
            ],
          ),
        ),
      ),
    );
  }
}