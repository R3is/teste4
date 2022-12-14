import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';
import 'package:teste4/Cadastro.dart';
import 'package:teste4/RegistroIMC.dart';
import 'package:teste4/RegistroTemperatura.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: ''),
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
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  bool selecao = false;
  bool Mostra = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white30, Colors.white24, Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Padding(
                padding: EdgeInsets.all(2),
                child: Image.network("https://www.canva.com/design/DAFOmBTW5Ho/2sgK8rAW8Q8CpH7M9vRk3g/view?utm_content=DAFOmBTW5Ho&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
                  height: 200,
                  width: 200,),
              ),*/

              const SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(
                      image: AssetImage("imagens/myapp.png"),
                      fit: BoxFit.fitHeight)),
              TextFormField(
                controller: controllerUser,
                validator: (UserValue) {
                  var User = UserValue ?? '';
                  if (User.isEmpty) {
                    return ('Insira Usuário');
                  }
                  if (!User.contains('@sga.pucminas.br')) {
                    return ('Usuário Válido');
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle_outlined), hintText: "Usuário"),
              ),
              TextFormField(
                obscureText: Mostra == false ? true : false,
                controller: controllerSenha,
                /*validator: (SenhaValue) {
                  RegExp vale = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.?[0-9])(?=.*?[!@#\$&*^~]).{5,}$');
                  var Senha = SenhaValue ?? '';
                  if (Senha.isEmpty) {
                    return ('Insira Usuário');
                  }
                  if (!vale.hasMatch(Senha)) {
                    return ('Usuário Válido');
                  }
                  return null;
                },*/
                decoration: const InputDecoration(
                    icon: Icon(Icons.key), hintText: "Senha"),
              ),
              SizedBox(height: 10),
              Container(
                  child: ElevatedButton(
                onPressed: () => {
                  login()
                },
                child: const Text("             Fazer Login             "),
              )),
              SizedBox(height: 5),
              CheckboxListTile(
                title: const Text('Permanecer Conectado'),
                value: selecao,
                onChanged: (bool? value) {
                  setState(() {
                    selecao = value!;
                  });
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Cad()));
                      },
                      child: const Text(
                          '        Não possui Conta? Criar conta       '))),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    if (controllerUser.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Obrigatório preencher email!'),
        ),
      );
      return;
    } else {
      if (controllerSenha.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Obrigatório preencher senha!'),
          ),
        );
        return;
      } else {
        try {
          UserCredential userCredential =
              await _firebaseAuth.signInWithEmailAndPassword(
                  email: controllerUser.text, password: controllerSenha.text);
          if (userCredential != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }
          ;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuário não encontrado!'),
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha incorreta!'),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        }
      }
    }
  }
}
