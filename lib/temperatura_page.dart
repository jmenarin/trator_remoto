import 'package:flutter/material.dart';

class TemperaturaPage extends StatelessWidget {
  TemperaturaPage({super.key});

  List<String> temperaturaHora = [
    '22ºC',
    '23ºC',
    '24ºC',
    '25ºC',
    '25ºC',
    '26ºC',
    '28ºC',
    '28ºC',
    '29ºC',
    '30ºC',
    '32ºC',
    '33ºC',
    '34ºC',
    '34ºC',
    '35ºC',
    '35ºC',
    '35ºC',
    '30ºC',
    '29ºC',
    '27ºC',
    '26ºC',
    '25ºC',
    '25ºC',
    '24ºC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Temperatura ultimas 24 horas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
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
                          'A temperatura no horario $teste$index:00 foi ${temperaturaHora[index]}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
