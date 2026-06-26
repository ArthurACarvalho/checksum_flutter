import 'package:flutter/material.dart';
import 'package:flutter_application_1/backend/calcular_checksum.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController controller;
  String text = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var larguraTela = MediaQuery.of(context).size.width;
    var alturaTela = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Calculadora de checksum",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: larguraTela * 0.5,
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (value) {
                    setState(() {
                      text = controller.text;
                    });
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Digite o comando",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                final calcularChecksum = CalcularChecksum();
                calcularChecksum.calcularChecksumProtocoloZH(text.toUpperCase());
              },
              child: Text("Calcular Checksum"),
            ),
          ],
        ),
      ),
    );
  }
}