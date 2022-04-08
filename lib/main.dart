import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infomedia = "Informe suas notas!";

  TextEditingController g1 = TextEditingController();

  TextEditingController g2 = TextEditingController();

  void _resetFields() {
    setState(() {
      g1.text = "";

      g2.text = "";

      _infomedia = "Informe suas notas!";
    });
  }

  void _calculate() {
    setState(() {
      double n1 = double.parse(g1.text);

      double n2 = double.parse(g2.text);

      double media = ((n1 + n2)) / 2;

      if (media >= 6) {
        _infomedia = "Sua média é ${media.toStringAsPrecision(3)}, parabéns!";
      } else {
        _infomedia =
            "Sua média é ${media.toStringAsPrecision(3)}, recuperação!";
      }
    });
  }

  void clearFields() {
    g1.clear();
    g2.clear();
    setState(() {
      _infomedia = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de Média"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Insira a nota 01 (N1)",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: g1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira a nota 01";
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Insira a nota 02 (N2)",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()),
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: g2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira a nota da G2";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _calculate();
                          }
                        },
                        child: const Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                        //child: Colors.amber,
                      ),
                    ),
                  ),
                  Text(
                    _infomedia,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    child: const Text("Limpar"),
                    onPressed: clearFields,
                  ),
                ],
              ),
            )));
  }
}
