import 'package:flutter/material.dart';
import 'dart:math';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  // final String title;

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  String numero = '';
  void _incrementCounter() {
    setState(() {
      calculo = calculo;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String mensagem = 'Abastecer com ';
  double calculo = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gasolina x Alcools'),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://www.zuldigital.com.br/blog/wp-content/uploads/2020/09/shutterstock_339529217_Easy-Resize.com_.jpg',
                  width: 300,
                  height: 150,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Valor do álcool',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Valor da gasolina',
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        double alcool = double.parse(_nameController.text);
                        double gasolina = double.parse(_emailController.text);
                        calculo = (alcool / gasolina) * 100;
                        // String mensagem = 'Abastecer com ';
                        if (calculo >= 70) {
                          mensagem += 'álcool';
                        } else {
                          mensagem += 'gasolina';
                        }
                        _incrementCounter();
                      }
                      await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(mensagem),
                            content: Text(mensagem),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  mensagem = 'Abastecer com ';
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Calcular'),
                  ),
                ),
                Text("Resultado: $calculo")
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}
