import 'package:flutter/material.dart';
import 'package:trator_remoto/alertas_page.dart';
import 'package:trator_remoto/status_page.dart';
import 'package:trator_remoto/temperatura_page.dart';
import 'package:trator_remoto/umidade_page.dart';
import 'package:trator_remoto/velocidade_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String state = 'Parado';
  var teste;
  Future verificar_url(String state) async {
    try {
      var result = await http.get(Uri.parse('http://192.168.1.130/$state'));
      teste = result.body;
      print(teste);
    } catch (e) {
      print(e);
    }
  }

  atualizarState(String statePass) {
    setState(() {
      state = statePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          color: Colors.grey[800],
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 30),
                child: Image.asset('assets/images/trator_logo.png',
                    alignment: Alignment.topCenter),
              ),
              Text('Trator John Deere',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('2022',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/fundo.jpg'),
                    opacity: 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    //color: Colors.grey[300],
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              verificar_url('frente');
                              atualizarState('P/ Frente');
                            },
                            icon: Icon(
                              Icons.arrow_drop_up_outlined,
                              color: Colors.white,
                              size: 100,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                  onPressed: () {
                                    verificar_url('alert');
                                  },
                                  icon: Icon(
                                    Icons.arrow_left_outlined,
                                    color: Colors.white,
                                    size: 100,
                                  )),
                            ),
                            IconButton(
                                onPressed: () {
                                  verificar_url('pare');
                                  atualizarState('Parado');
                                },
                                icon: Icon(
                                  Icons.stop_rounded,
                                  size: 80,
                                  color: Colors.white,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_right_outlined,
                                    color: Colors.white,
                                    size: 100,
                                  )),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              verificar_url('tras');
                              atualizarState('P/ Trás');
                            },
                            icon: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.white,
                              size: 100,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.grey[300],
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VelocidadePage()));
                                  },
                                  child: Container(
                                    height: 50,
                                    child: Text(
                                      'Velocidade',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: Text(
                                    '0 km/h',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TemperaturaPage()));
                            },
                            child: Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    child: Text(
                                      'Temperatura',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(
                                      '35ºC',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UmidadePage()));
                            },
                            child: Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    child: Text(
                                      'Umidade',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(
                                      '65%',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StatusPage()));
                            },
                            child: Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(
                                      '$state',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlertasPage()));
                            },
                            child: Container(
                              height: 100,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    child: Text(
                                      'Alerta',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Text(
                                      'N/A',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
