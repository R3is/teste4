import 'package:flutter/material.dart';
import 'package:teste4/Home.dart';
import 'package:teste4/Cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const Log());
}

class Log extends StatelessWidget {
  const Log({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Login'),
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
  int counter = 0;
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  bool selecao  = false;
  bool Mostra = false;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

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
               Padding(
                padding: EdgeInsets.all(2),
                child: Image.network('https://www.canva.com/design/DAFOmBTW5Ho/2sgK8rAW8Q8CpH7M9vRk3g/edit?utm_content=DAFOmBTW5Ho&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton',
                  height: 200,
                  width: 200,),
              ),

              const SizedBox(
                  height: 120,
                  width: 120,
                  child: Image(image: AssetImage("imagens/myapp.png"),fit: BoxFit.fitHeight)

              ),
              TextFormField(
                controller: controllerUser,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
              TextFormField(
                obscureText: Mostra == false ? true : false,
                controller: controllerSenha,
                decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Senha"
                ),
              ),
              CheckboxListTile(
                title: const Text('Pemanecer Contectado'),
                value: selecao,
                onChanged: (bool? value) {
                  setState(() {
                    selecao=value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                  child:
                  ElevatedButton(
                    onPressed: (){
                     login();
                    },
                    child:const Text("            Fazer Login            "
                    ),
                  )
              ),
              SizedBox(height: 10),
              Text("Não possui conta?"),
              SizedBox(height: 10),
              Container(
                  child:
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Cad()));

                      },
                      child:const Text('      Criar Conta      '
                      )
                  )
              ),

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
              email: controllerUser.text,
              password: controllerSenha.text);
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