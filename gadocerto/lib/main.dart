import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 15, 14, 14)),
      home: const MyHomePage(title: 'Gado Certo IMC'),
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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String imc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  'Calcule seu IMC',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 140, 0),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0))),
                        labelText: 'Peso',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 255, 140, 0)),
                        hintText: 'Kg',
                        filled: true,
                        fillColor: Color(0xFFEFEFEF),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 140, 0))))),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0))),
                        labelText: 'Altura',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 255, 140, 0)),
                        hintText: 'Cm',
                        filled: true,
                        fillColor: Color(0xFFEFEFEF),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 140, 0))))),
                const SizedBox(
                  height: 10,
                ),
                imc.length > 1
                    ? RichText(
                        text: TextSpan(
                            text: 'IMC de ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Color(0xFFEFEFEF)),
                            children: <TextSpan>[
                            TextSpan(
                                text: imc,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 140, 0))),
                            const TextSpan(
                                text: ' Kg/m²',
                                style: TextStyle(color: Color(0xFFEFEFEF)))
                          ]))
                    : const Text(''),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num result = 0;

                      if (pesoController.text.isNotEmpty &&
                          alturaController.text.isNotEmpty) {
                        result = (num.parse(pesoController.text) /
                            (num.parse(alturaController.text) *
                                num.parse(alturaController.text)));

                        imc = (10000 * result).toStringAsFixed(2);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 140, 0)),
                  child: const Text(
                    'Calcular IMC',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
