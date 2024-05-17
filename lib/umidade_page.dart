import 'package:flutter/material.dart';

class UmidadePage extends StatelessWidget {
  UmidadePage({super.key});

  List<String> temperaturaHora = [
    '88%',
    '88%',
    '85%',
    '85%',
    '83%',
    '82%',
    '82%',
    '70%',
    '79%',
    '78%',
    '77%',
    '75%',
    '75%',
    '74%',
    '70%',
    '69%',
    '70%',
    '75%',
    '75%',
    '79%',
    '83%',
    '84%',
    '85%',
    '87%',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Alertas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: temperaturaHora.length,
              itemBuilder: (context, index) {
                var teste;
                if (index < 10) {
                  teste = '0';
                } else {
                  teste = '';
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'A umidade no horario $teste$index:00 foi ${temperaturaHora[index]}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
