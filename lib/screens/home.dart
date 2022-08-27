// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants/app_constants.dart';
import 'package:bmi_calculator_app/widgets/left_bar.dart';
import 'package:bmi_calculator_app/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8)
                      )
                    )
                    ,
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 39,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        )
                    )
                    ,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _w = double.parse(_weightController.text);
                double _h = double.parse(_heightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult>25){
                    _textResult = "You're over weight";
                  }else if(_bmiResult>=18.5 && _bmiResult<=25){
                    _textResult = "You're normal weight";
                  }else{
                    _textResult = "You're under weight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: accentHexColor)),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, color: accentHexColor)),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: accentHexColor))),
            ),
            SizedBox(height: 10),
            RightBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 20),
            RightBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 70),
            SizedBox(height: 50),
            LeftBar(barWidth: 70)
          ],
        ),
      ) ,
    );
  }
}
