import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';
import 'package:teste4/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teste4/main.dart';

void main() {
  runApp(const Cad());
}

class Cad extends StatelessWidget {
  const Cad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Cadastro'),
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

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  /*bool _Mostrar = false;*/

  bool Mostra = false;
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
          MaterialPageRoute(builder: (context) => const MyApp())),
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white30, Colors.white24, Colors.white]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Padding(
                padding: EdgeInsets.all(2),
                child: Image.network('https://www.canva.com/design/DAFOmBTW5Ho/2sgK8rAW8Q8CpH7M9vRk3g/edit?utm_content=DAFOmBTW5Ho&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton',
                  height: 200,
                  width: 200,),
              ),*/

               const SizedBox(
                height: 120,
                width: 120,
                child: Image(image: AssetImage("imagens/myapp.png"),fit: BoxFit.fitHeight)

              ),

              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle_outlined),
                  hintText: "Nome Completo",
                ),
              ),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail_outline),
                  hintText: "Email",
                ),
              ),
              TextFormField(
                obscureText: Mostra == false ? true : false,
                controller: _senhaController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined),
                    hintText: "Senha"
                ),
              ),
              TextFormField(
                obscureText: Mostra == false ? true : false,
                controller: _confirmController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.vpn_key_outlined),
                    hintText: "Confirmar Senha"
                ),
              ),
              CheckboxListTile(
                value: Mostra,
                checkColor: Colors.pink,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    Mostra = !Mostra;
                  });
                },
                title: const Text('Mostrar Senha'),
              ),
              SizedBox(height: 10),
              Container(
                  child:
                  ElevatedButton(
                      onPressed: (){
                      cadastro();
                      },
                      child:const Text('Criar Conta')
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  cadastro() async {
    String nome_user = "";
    if (_senhaController.text != _confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As Senhas Precisam Ser Iguais!'),
        ),
      );
    } else {
      try {
        UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _senhaController.text);
        if (userCredential != null) {
          userCredential.user!.updateDisplayName(_nomeController.text);
          nome_user = _nomeController.text;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                      '$nome_user, seu cadastro foi realizado com sucesso!'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyApp(),
                              ),
                                  (route) => false);
                        },
                        child: const Text('Ok'))
                  ],
                );
              });
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Senha fraca!'),
            backgroundColor: Colors.redAccent,));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email já cadastrado!'),
                backgroundColor: Colors.redAccent,));
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Formato de email inválido!'),
                backgroundColor: Colors.redAccent,));
        } else if (e.code == 'unknown') {

          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Preencha os dados!'),
                backgroundColor: Colors.redAccent,
              )
          );
        }
      }
    }
  }
}