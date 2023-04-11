import 'package:flutter/material.dart';
import 'dart:math';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  // final String title;

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  int numero = 0;
  increment() {
    setState(() {
      numero++;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final peso = TextEditingController();
  final altura = TextEditingController();
  final calculo = TextEditingController();

  void resultado() {
    setState(() {
      double peso_number = double.parse(peso.text);
      double altura_number = double.parse(altura.text) / 100;
      double result = peso_number / pow(altura_number, 2);
      calculo.text =
          "Seu peso IMC é: ${result.toStringAsFixed(2)} \nVoce é classificado como: ";
      if (result < 18.5) {
        calculo.text = calculo.text + 'MAGREZA';
      } else if (18.5 < result && result < 24.9) {
        calculo.text = calculo.text + 'NORMAL';
      } else if (25.0 < result && result < 29.9) {
        calculo.text = calculo.text + 'SOBREPESO';
      } else if (30.0 < result && result < 39.9) {
        calculo.text = calculo.text + 'OBESIDADE';
      } else if (result > 40.0) {
        calculo.text = calculo.text + 'OBESIDADE GRAVE';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: IconButton(
                      icon: Icon(Icons.person, size: 50, color: Colors.green),
                      onPressed: () {},
                    ),
                  ),
                  // TextField(keyboardType: TextInputType.number),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: peso,
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                    ),
                  ),
                  TextFormField(
                    controller: altura,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          resultado();
                          // Navigator.pushNamed(context, '/second');
                        }
                        // await showDialog<void>(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text("olá"),
                        //       content: Text("olá"),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: const Text('OK'),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                      child: Text('Calcular'),
                    ),
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical:
                            20), //apply padding horizontal or vertical only
                    child: Text("Informe seus dados!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  )),
                  Text(calculo.text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
