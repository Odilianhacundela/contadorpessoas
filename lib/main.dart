import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'Não Entra';
  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people <= 10 && _people >= 0) {
        _infoText = 'Pode Entrar';
      } else if (_people > 10) {
        _infoText = 'Lotado';
      } else {
        _infoText = 'Que loucura';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/restaurante.png',
          fit: BoxFit.cover,
          width: 10000.0,
          height: 10000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pessoas: $_people',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: Text(
                        '+1',
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        '-1',
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
