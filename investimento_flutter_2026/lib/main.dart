import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Investimento', home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  double valorMensal = 0.0;
  double taxa = 0.0;
  int meses = 0;

  double totalSemJuros = 0.0;
  double montanteComJuros = 0.0;
  String? resultado;

  void calcular() {
    double i = taxa / 100;

    totalSemJuros = valorMensal * meses;

    if (i == 0) {
      montanteComJuros = totalSemJuros;
    } else {
      montanteComJuros = valorMensal * ((pow(1 + i, meses) - 1) / i);
    }

    resultado =
        "Montante acumulado sem juros: R\$ ${totalSemJuros.toStringAsFixed(2)}\nMontante acumulado com juros compostos: R\$ ${montanteComJuros.toStringAsFixed(2)}";
    setState(() {});
  }

  void alert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(255, 0, 0, 0.298),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              Text(
                "Simulador de Investimento",
                style: TextStyle(
                  fontSize: 20.0,
                  color: const Color.fromARGB(255, 156, 10, 0),
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: "Valor mensal para investir",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  valorMensal = double.tryParse(value) ?? 0.0;
                },
              ),

              TextField(
                decoration: InputDecoration(labelText: "Número de meses"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  meses = int.tryParse(value) ?? 0;
                },
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: "Taxa de juros ao mês (%)",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  taxa = double.tryParse(value) ?? 0.0;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  calcular();
                  alert(context, "$resultado");
                },
                child: Text("Calcular"),
              ),

              Text(
                "Montante acumulado sem juros: R\$ ${totalSemJuros.toStringAsFixed(2)}",
              ),
              Text(
                "Montante acumulado com juros compostos: R\$ ${montanteComJuros.toStringAsFixed(2)}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
