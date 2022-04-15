import 'package:cacl_app/controller.dart';
import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

void main() => runApp(
  DevicePreview(
    // enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}



class MyHomePage extends StatelessWidget {
const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  
  
  Widget buildButton(String buttonText) {
    return Expanded(
      child: GetBuilder<CalculatorController>(
                    init: CalculatorController(),
                    builder: (controller) =>OutlineButton(
        padding: const EdgeInsets.all(24.0),
        child: Text(buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
          ),
        onPressed: () => 
          controller.buttonPressed(buttonText)
        ,
      ),
    )
    )
    ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(title),
            ),
            body: Column(
              children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: GetBuilder<CalculatorController>(
                    init: CalculatorController(),
                    builder: (controller) =>Text(controller.output, style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                
              )))
              
            ),
            const Expanded(
              child: Divider(color: Colors.amber),
            ),
            

            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                
                buildButton("9"),
                buildButton("/")
              ]),

              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),

              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),

              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),

              Row(children: [
                buildButton("CLEAR"),
                buildButton("="),
              ])
            ])
              ],
            )),
      ),
    );
  }
}