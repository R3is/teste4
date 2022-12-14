import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';

void main() {
  runApp(const CalcConv());
}

class CalcConv extends StatelessWidget {
  const CalcConv({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Conversor'),
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
  int _counter = 0;
  TextEditingController controllerTempera = TextEditingController();
  String resultado = '';

  final items = ['Kelvin', 'Fahrenheit', 'Reaumur','Rankine'];
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
              DropdownButton<String>(
                value: value,
                isExpanded: true,
                items: items.map(buildMenuItem).toList(),
                onChanged: (value) => setState(() => this.value = value),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: controllerTempera,
                decoration: const InputDecoration(
                  hintText: "Quantos graus está fazendo ?",
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
                          if(value == 'Kelvin') {
                            num numAux = (num.parse(controllerTempera.text)
                                -273.15);
                            resultado = numAux.toStringAsFixed(2);
                          }
                          if(value == 'Fahrenheit') {
                            num numAux = ((num.parse(controllerTempera.text)
                                /(9/5)) + 32);
                            resultado = numAux.toStringAsFixed(2);
                          }
                          if(value == 'Reaumur') {
                            num numAux = (num.parse(controllerTempera.text)
                                * (4/5));
                            resultado = numAux.toStringAsFixed(2);
                          }
                          if(value == 'Rankine') {
                            num numAux = ((num.parse(controllerTempera.text)
                                /(9/5)) + 491.67);
                            resultado = numAux.toStringAsFixed(2);
                          }
                        });
                      },
                      child:const Text('Converter'))
              ),
            ],
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}