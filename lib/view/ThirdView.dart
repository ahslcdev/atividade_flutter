import 'package:flutter/material.dart';
import 'dart:math';

class ThirdView extends StatefulWidget {
  const ThirdView({super.key});

  // final String title;

  @override
  State<ThirdView> createState() => _ThirdViewState();
}

String nome = '';
String email = '';

class _ThirdViewState extends State<ThirdView> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          nome = _nameController.text;
                          email = _emailController.text;
                          // print(text);
                          print("to aqui");
                          // double calculo = (alcool / gasolina) * 100;
                          Navigator.pushNamed(context, '/second');
                        }
                      },
                      child: Text('Enviar')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DadosView extends StatelessWidget {
  const DadosView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(child: Text("${nome} \n${email}")
          // ElevatedButton(
          //   // Within the SecondScreen widget
          //   onPressed: () {
          //     print(nome);
          //     print(email);
          //     // Navigate back to the first screen by popping the current route
          //     // off the stack.
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Go back!'),
          // ),
          ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Olá'),
    // );
  }
}
