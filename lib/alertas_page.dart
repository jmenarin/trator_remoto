import 'package:flutter/material.dart';

class AlertasPage extends StatelessWidget {
  AlertasPage({super.key});

  List<String> temperaturaHora = [
    '07:30',
    '08:26',
    '09:27',
    '10:12',
    '10:49',
    '11:32',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        title: Text('Alertas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: temperaturaHora.length,
              itemBuilder: (context, index) {
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
                        'Um alerta notificado no horario ${temperaturaHora[index]}',
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
