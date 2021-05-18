import 'package:project/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/left_bar.dart';
import 'package:project/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Altura",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),

                //-------------------------------------------------

                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Peso",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult >= 40) {
                    _textResult =
                        "Você está com obesidade grave (Obesidade do tipo III)";
                  } else if (_bmiResult >= 30 && _bmiResult < 40) {
                    _textResult =
                        "Você está com obesidade (Obesidade do tipo II)";
                  } else if (_bmiResult >= 25 && _bmiResult < 30) {
                    _textResult =
                        "Você está com sobrepeso (Obesidade do tipo I)";
                  } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                    _textResult = "Você está normal, parabéns!";
                  } else if (_bmiResult < 18.5) {
                    _textResult = "Você está abaixo do ideal, coma mais";
                  } else {
                    _textResult = "Erro!";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 6),
                          child: Text(
                            _textResult,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: accentHexColor),
                          )))),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 50),
          ],
        ),
      ),
    );
  }
}
