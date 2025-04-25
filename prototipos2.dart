//Calculadora de IMC
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  const CalculadoraIMCApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraIMCPagina(),
    );
  }
}

class CalculadoraIMCPagina extends StatefulWidget {
  @override
  _CalculadoraIMCPaginaEstado createState() => _CalculadoraIMCPaginaEstado();
}

class _CalculadoraIMCPaginaEstado extends State<CalculadoraIMCPagina> {
  final TextEditingController _controladorAltura = TextEditingController();
  final TextEditingController _controladorPeso = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tabela de Referência do IMC',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              tabelaIMC(),
              const SizedBox(height: 20),
              campoEntrada('Altura [Cm]', 'Ex: 182', _controladorAltura, ''),
              const SizedBox(height: 10),
              campoEntrada('Peso [Kg]', 'Ex: 92,5', _controladorPeso, ''),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, // Nenhuma funcionalidade associada
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'CALCULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabelaIMC() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(2),
        },
        children: const [
          TableRow(
            decoration: BoxDecoration(color: Colors.blueAccent),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Classificação',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'IMC (kg/m²)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Abaixo do peso',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '< 18.5',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Peso normal',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '18.5 - 24.9',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Sobrepeso',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '25 - 29.9',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Obesidade',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '>= 30',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget campoEntrada(String rotulo, String textoPlaceholder, TextEditingController? controlador, String unidade) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rotulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controlador,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: textoPlaceholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(unidade),
          ],
        ),
      ],
    );
  }
}
